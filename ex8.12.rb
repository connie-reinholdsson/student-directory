#What happens if the user doesn't enter any students?
# It will try to print an empty list. How can you use an if statement (💊 Control Flow)
# to only print the list if there is at least one student in there?


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  name = gets.strip
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
    name = gets.strip
  end
  #return the array of students
  students
end





def print_header(students)
  students_exist = students.each do |student| return student[:name]
    if students_exist >= 1
puts "The students of Villains Academy"
puts "-------------"
else
end
end
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
print_header(students)
print(students)
print_footer(students)
