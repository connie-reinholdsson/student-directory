#We are in fact using CSV format to store data.
#However, Ruby includes a library to work with the CSV files that we could use
#instead of working directly with the files. Refactor the code to use this library.

require 'csv' #Require 'csv' to activate csv library,

@students = []

def add_students
@students << {name: @name, cohort: :november}
end

def print_menu
menu = <<END
1. Input the students
2. Show the students
3. Save the list
4. Load the list
9. Exit
END
puts menu
end

def interactive_menu
  loop do
    print_menu
    print "Please select an option: "
    menu_process(STDIN.gets.chomp)
  end
end

def menu_process(selection)
  option = "Option #{selection} selected."
  feedback = "Option #{selection} completed."
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
    file_to_load
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
  puts "Please input the file to save in: "
  input_file = STDIN.gets.chomp
  CSV.open(input_file, "w") do |csv| #Refactor to CSV format.
  @students.each do |student| #Iterate through the @students array.
  csv << [student[:name], student[:cohort]] #Push each line to CSV.
  end
end
end

def file_to_load
    puts "Please input the file to load: "
    filename = STDIN.gets.chomp
    load_students(filename)
end

def students_loaded(filename)
puts "Loaded #{@students.count} students from #{filename}."
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) do |row| #Refactor to CSV format using .foreach.
    @name, cohort = row #Take out chomp and split, as CSV does this automatically.
    add_students
end
end

def try_load_students
  filename = ARGV.first
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
