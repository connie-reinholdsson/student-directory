# Rewrite the each() method that prints all students using while or until control flow methods (💊 Loops).
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
    puts "Now we have #{students.count} students"
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


# Rewrite the each() method that prints all students using while or until control flow methods (💊 Loops).
def print(students)
  student_count = 0
  while student_count < students.length
    puts "#{students[student_count][:name]} (#{students[student_count][:cohort]} cohort)"
    student_count += 1
  end
end

#{:name=>"Conor McGinley", :cohort=>:november}
#puts my_hash["name"]


def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
