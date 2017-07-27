@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print(@students)
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end




def input_students
  puts "Please enter the names of the students"
  puts "To finish, press return twice"
  name = gets.chomp
  while !name.empty? do
puts 'cohort?'
cohort = gets.chomp
cohort = :november if cohort = ""
    @students << {name: name, cohort: cohort}
    puts "Now we have #{@students.count} #{@students.count==1 ? "student" : "students"}"
    # get another name from the user
    name = gets.chomp
  end
end

def print_header
puts "The Students of Villains Academy".center(30)
puts "-------------".center(30)
end

def print(array)
array.each_with_index do |hash,i|
puts "#{i+1}. #{hash[:name]} (#{hash[:cohort]} cohort)".center(30)
i +=1
end
end

def print_footer
  puts "Overall, we have #{@students.size} great #{@students.count==1 ? "student" : "students"}".center(30)
end

interactive_menu
