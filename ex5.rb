#Our code only works with the student name and cohort.
#Add more information: hobbies, country of birth, height, etc.

def input_students
  puts "Please enter the student's name, country of birth, height and hobbies: "
  puts "To finish, just hit return five times."
  #create an empty array
  students = []
  print "Name: "
  name = gets.chomp
  print "Country of Birth: "
  country_of_birth = gets.chomp
  print "Height (cm): "
  height = gets.chomp
  print "Hobbies: "
  hobbies = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november, country_of_birth: country_of_birth, height: height, hobbies: hobbies}
    puts "Now we have #{students.count} students"
    #get another name from the user
    print "Name: "
    name = gets.chomp
    print "Country of Birth: "
    country_of_birth = gets.chomp
    print "Height (cm): "
    height = gets.chomp
    print "Hobbies: "
    hobbies = gets.chomp
  end
  #return the array of students
  students
end

def print_header
puts "The students of Villains Academy"
puts "-------------"
end

def prints(students)
students.each do |student|
  puts "#{student[:name]}, (#{student[:cohort]} cohort), Country of Birth: #{student[:country_of_birth]}, Height: #{student[:height]}, Hobbies: #{student[:hobbies]}"
end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
prints(students)
print_footer(students)
