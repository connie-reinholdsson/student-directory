#Right now, when the user choses an option from our menu,
#there's no way of them knowing if the action was successful.
#Can you fix this and implement feedback messages for the user?

@students = [] #an empty array accessible to all methods

def add_students #
@students << {name: @name, cohort: :november}
end

def print_menu
menu = <<END
1. Input the students
2. Show the students
3. Save the list to students.csv
4. Load the list from students.csv
9. Exit
END
puts menu
end

def interactive_menu
  loop do
    print_menu
    print "Please select an option: " #Add "select option" to give clearer user instructions.
    menu_process(STDIN.gets.chomp)
  end
end

def menu_process(selection)
  option = "Option #{selection} selected." #Put in option 'selected' to confirm user selection.
  feedback = "Option #{selection} completed." #Put in option 'feedback' to confirm completion.
  #As 'selection' is a parameter, I could not convert it into a global variable, hence the reason
  #I made 'option' and 'feedback' local variables in 'menu_process' instead of functions.
  case selection
  when "1"
    puts option
    input_students
    puts feedback
  when "2"
    puts option
    show_students
    puts feedback
  when "3"
    puts option
    save_students
    puts feedback
  when "4"
    puts option
    load_students
    puts feedback
  when "9"
    puts option
    puts "Exiting the program."
    exit
  else puts "Please select one of the menu options: "
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice. "
  #get the first name
  @name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
  while !@name.empty? do
    #add the student hash to the array
    add_students
    puts "Now we have #{@students.count} students"
    #get another name from the user
    @name = STDIN.gets.chomp
  end
end

def show_students
print_header
print_students_list
print_footer
end

def print_header
puts "The students of Villains Academy"
puts "-" * 10
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
    csv_line = student_data.join(",")
    #Join the name and cohort, with a ',' between.
    file.puts csv_line
    #Write the 'csv_line' to the file using puts.
  end
  file.close
end



def load_students(filename = "students.csv")
  file = File.open(filename, "r") #Set variable 'file' to open file with read access.
  file.readlines.each do |line| #Read all the lines into an array. .readlines it a method.
    #and iterate over it.
    @name, cohort = line.chomp.split(',') #On every iteration,
    #we discard the trailing new line character (.chomp) from the line,
    #split it at comma (gives us an array with two elements) and assign them
    #to name and cohort.
    add_students
end
file.close
end

def students_loaded(filename)
puts "Loaded #{@students.count} students from #{filename}."
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  if filename.nil?
    load_students
    students_loaded("students.csv")
  elsif File.exists?(filename)
  load_students(filename)
  students_loaded(filename)
else
    puts "Sorry, #{filename} doesn't exist."
    exit #quit the program
  end
end

try_load_students
interactive_menu
