require 'csv'

@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load a list"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    choose_save_students
  when "4"
    choose_load_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def no_file_found(filename)
  puts "Sorry, #{filename} doesn't exist."
  return
end

def choose_save_students
  puts 'Please type the full name of the file you would like to save to'
  filename = STDIN.gets.chomp
  if File.exists?(filename)
    save_students(filename)
  else
  no_file_found(filename)
  end
end

def get_filename
  puts 'Please type the full name of the file you would like to load/save'
  filename = STDIN.gets.chomp
  return filename
end

def choose_load_students
  filename = get_filename
  if File.exists?(filename)
    load_students(filename)
  else
    no_file_found(filename)
  end
end

def action_successful
  puts "Action successful"
end

def input_students_message
  puts "Please enter the names of the students"
  puts "To finish, press return twice"
end

def input_students
  input_students_message
  name = STDIN.gets.chomp
  while !name.empty? do
    puts 'cohort?'
    cohort = STDIN.gets.chomp
    cohort = :november if cohort == ""
    add_students_to_list(name, cohort)
    puts "Now we have #{@students.count} #{@students.count==1 ? "student" : "students"}"
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def add_students_to_list (name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def print_header
puts "The Students of Villains Academy".center(30)
puts "-------------".center(30)
end

def print_student_list
  @students.each_with_index do |hash,i|
    puts "#{i+1}. #{hash[:name]} (#{hash[:cohort]} cohort)".center(30)
    i +=1
  end
end

def print_footer
  puts "Overall, we have #{@students.size} great #{@students.count==1 ? "student" : "students"}".center(30)
end

def save_students(filename)

    CSV.open(filename,"wb") do |line|
      @students.each do |student|
      line << [student[:name], student[:cohort]]

    end
  end
action_successful
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) do |row|
    name, cohort = row
    add_students_to_list(name,cohort)
  end
action_successful
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end


try_load_students
interactive_menu
