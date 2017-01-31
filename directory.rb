# student_count = 11

students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

puts "The students of Villains Academy"
puts "------------"
students.each do |student|
  puts student
end

puts "Overall, we have #{students.count} great students"


=begin
------------------------------------------------------
student_count = 11

#first we print the list of students
puts "The students of Villains Academy"
puts "------------"
puts "Dr. Hannibal Lecter"
puts "Darth Vader"
puts "Nurse Ratched"
puts "Michael Corleone"
puts "Alex DeLarge"
puts "The Wicked Witch of the West"
puts "Terminator"
puts "Freddy Krueger"
puts "The Joker"
puts "Joffrey Baratheon"
puts "Norman Bates"

#finally, we print the total number of students using string interpolation
print "Overall, we have #{student_count} great students"

#it's important the print() doesn't add new line chars
#print student_count
#puts " great students"

# print "Overall, we have \n11 \ngreat students"
=end
