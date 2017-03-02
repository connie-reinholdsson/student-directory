@students = [] #an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    #get another name from the user
    name = gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
end
end

def print_menu
puts "1. Input the students"
puts "2. Show the students"
puts "3. Save the list to students.csv"
puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
print_header
print_students_list
print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit #this will cause the program to terminate
  else puts "I don't know what you meant, try again"
end
end

def print_header
puts "The students of Villains Academy"
puts "-------------"
end

def print_students_list
@students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  #open the file for writing, store the contents to 'file'.
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    #For every iteration (name and cohort) we create a new array.
    #The [] is for the new array.
    #["Dr. Hannibal Lecter", :november]
    csv_line = student_data.join(",")
    #Join the name and cohort, with a ',' between.
    file.puts csv_line
    #Write the 'csv_line' to the file using puts.
  end
  file.close
end



#[ "a", "b", "c"].join => "abc" (A string.)
#puts "Hello" samas as STDOUT.puts "Hello"

#To write to a file instead of the input stream:
#file.puts "This is written to a file."























interactive_menu
