def input_students
  puts "Please enter the names of the students"
  puts "To finish, just keep hitting return"
  # create empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
puts "what are #{name}'s hobbies?"
hobbies = gets.chomp
puts "what is #{name}'s nationality?"
nationality = gets.chomp
    students << {name: name, cohort: :november, hobbies: hobbies, nationality: nationality}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
students
end

def print_header
puts "The Students of Villains Academy".center(30)
puts "-------------".center(30)
end

def print(students)
i = 0
  while i < students.count
puts "#{i+1}. #{students[i][:name]} (#{students[i][:cohort]} cohort, from #{students[i][:nationality]} and likes #{students[i][:hobbies]} )".center(30)
i +=1
end
end

def print_footer(students)
  puts "Overall, we have #{students.size} great students".center(30)
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
