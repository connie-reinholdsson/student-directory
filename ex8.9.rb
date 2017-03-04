#Right now if we have only one student, the user will see a message "Now we have 1 students",
# whereas it should be "Now we have 1 student". How can you fix it so that it used singular
#form when appropriate and plural form otherwise?
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    number_students = students.count
    if number_students == 1
        puts "Now we have #{students.count} great student"
      else
        puts "Now we have #{students.count} great students"
    end
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
puts "The students of Villains Academy"
puts "-------------"
end

def print(students)
students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
end
end

def print_footer(names)
  number_names = names.count
  if number_names == 1
      puts "Overall, we have #{names.count} great student"
    elsif
      number_names == 0
      puts "There are no students."
    else
      puts "Overall, we have #{names.count} great students"
  end
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
