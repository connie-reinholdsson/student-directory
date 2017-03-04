#EX 7:
#In the input_students method the cohort value is hard-coded.
#How can you ask for both the name and the cohort?
#What if one of the values is empty? Can you supply a default value?
#The input will be given to you as a string? How will you convert it to a symbol?
#What if the user makes a typo?

def input_students
  puts "Please enter the names of the students: "
  puts "When you're done, type 'finish' and press enter."
  #create an empty array
  students = []
  print "Name: "
  name = gets.chomp
  if name == ""
    name = "N/A"
  end

  cohorts = ['january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
  print "Cohort: "
  cohort = gets.chomp.downcase

  condition = true
  while condition
  if cohorts.include? cohort
  puts "Adding #{name} the cohort #{cohort}."
  condition = false
  elsif cohort == ""
    cohort = "N/A"
  condition = false
  else
    print "Please put in a cohort, make sure you spell it correctly :"
    cohort = gets.chomp.downcase
  end
  end

  #while the name is not empty, repeat this code
  while name != "finish" do
    #add the student hash to the array
    students << {name: name, cohort: cohort.downcase.to_sym}
    puts "Now we have #{students.count} students"
    #get another name from the user
    print "Name: "
    name = gets.chomp
    if name == ""
      name = "N/A"
    end
    cohorts = ['january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
    print "Cohort: "
    cohort = gets.chomp.downcase

    condition = true
    while condition
    if cohorts.include? cohort
    puts "Adding #{name} to the cohort #{cohort}."
    condition = false
    elsif cohort == ""
      cohort = "N/A"
    condition = false
    else
      print "Please put in a cohort, make sure you spell it correctly: "
      cohort = gets.chomp.downcase
    end
    end
  end

  #return the array of students
  students
end


def print_header
puts "The students of Villains Academy"
puts "-------------"
end

def prints(students)
  students.each_with_index do |student, index|
    new_index = index + 1
    #Access the student names and call .split. #Split into letters
    puts "#{new_index}. #{student[:name]} (#{student[:cohort]} cohort)"
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
