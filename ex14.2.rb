#How could you make the program load students.csv by default
#if no file is given on startup? Which methods would you need to change?

@students = [] #an empty array accessible to all methods

def add_students
@students << {name: @name, cohort: :november}
end

def print_menu
puts "1. Input the students"
puts "2. Show the students"
puts "3. Save the list to students.csv"
puts "4. Load the list from students.csv"
puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit #this will cause the program to terminate
  else puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
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



def load_students(filename = "students.csv")
  file = File.open(filename, "r") #Set variable 'file' to open file with read access.
  file.readlines.each do |line| #Read all the lines into an array. .readlines it a method.
    #and iterate over it.
    @name, cohort = line.chomp.split(',') #On every iteration,
    #we discard the trailing new line character (.chomp) from the line,
    #split it at comma (gives us an array with two elements) and assign them
    #to name and cohort.
    add_students
    #Create a new hash and put it in a list of students. Cohort could be 12 options, so puts .to_sym.
end
file.close
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  if filename.nil?
    load_students
    puts "Loaded #{@students.count} from #{"students.csv"}"
  elsif File.exists?(filename)
  load_students(filename)
  puts "Loaded #{@students.count} from #{filename}"
else
    puts "Sorry, #{filename} doesn't exist."
    exit #quit the program
  end
end

try_load_students
interactive_menu
