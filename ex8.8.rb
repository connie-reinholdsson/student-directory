#Once you complete the previous exercise, change the way the users are displayed:
#print them grouped by cohorts.
#To do this, you'll need to get a list of all existing cohorts (the map() method
#may be useful but it's not the only option), iterate over it and only print
#the students from that cohort.

def input_students
  puts "Please enter the names of the students: "
  puts "When you're done, type 'finish', followed by enter."
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
    puts "Please put in a cohort, make sure you spell it correctly!"
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
      puts "Please put in a cohort, make sure you spell it correctly!"
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
  cohorts = students.map do |student|
    student[:cohort]
  end
  #Get the cohorts for all the students and store it in variable 'cohorts'.
  cohorts.uniq.each do |x| #Delete all the dublicates of the cohorts.
    puts "#{x} cohort" #Puts the cohorts.
    students.each do |student| #Iterate through the students array
      #If the students exist in cohorts, puts their name.
      if student[:cohort] == x
        puts student[:name]
end
end
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
