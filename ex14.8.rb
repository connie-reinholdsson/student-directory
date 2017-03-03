#Write a short program that reads its own source code
#(search StackOverflow to find out how to get the name of the currently executed file)
# and prints it on the screen.

def self_writing_programme
File.open("ex14.8.rb", "r") do |file|
file.readlines.each do |line|
  puts line
end
file.close
end
end

self_writing_programme
