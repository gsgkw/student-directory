def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
students
end

def print_header
puts "The Students of Villains Academy"
puts "-------------"
end

def print(students)
  students.each_with_index{|student,i| puts "#{i+1}. #{student[:name]} (#{student[:cohort]} cohort)"}
end

def print_footer(students)
  puts "Overall, we have #{students.size} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
