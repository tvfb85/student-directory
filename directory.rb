def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create the empty array
  students = []
  # get the first name
  name = gets.chomp.to_sym
  # checks the user has entered a student
    if name.empty?
      puts "Nothing entered. Try again."
      input_students
    else
  # while the name is not empty, repeat this code
  while !name.empty? do
    #get user input for cohort value
    puts "Please enter the cohort (month): "
    cohort = gets.chomp
      if cohort.empty?
        cohort = :February
      end
    # convert cohort user input to symbol
    cohort = cohort.to_sym
    # asking for more user input
    puts "Enter height: "
    height = gets.chomp
    puts "Enter place of birth: "
    birthplace = gets.chomp
    puts "Enter interests: "
    interests = gets.chomp
    # add the student hash to the array
    students << { name: name, cohort: cohort, height: height, birthplace: birthplace, interests: interests}
    if students.length === 1
      puts "Now we have #{students.count} student. Enter a new name, or press return to finish."
    else
      puts "Now we have #{students.count} students. Enter a new name, or press return to finish."
    end
    # get another name from the user
    name = gets.chomp
  end

  # return the array of students
  students
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end


# using map() to group by cohort
def print(students)
  # sort the students hash by cohort
  grouped = students.sort_by{|student| student[:cohort]}
  # iterate over each cohort
  grouped.each do |cohort|
  # assign current iteration to a variable which is used to control flow below
  @current = cohort[:cohort]
  # string output for the current cohort
  puts "The students for the #{cohort[:cohort]} cohort are:".center(100)
    # iterate over current cohort with index
    grouped.each_with_index do |cohort, index|
      # evaluate if each student matches the current cohort
      if @current === cohort[:cohort]
        # outputs student data
        strOut = "#{index + 1}. #{cohort[:name]} (#{cohort[:cohort]} cohort)\n\Height: #{cohort[:height]}\n\tBorn: #{cohort[:birthplace]}\n\tInterests: #{cohort[:interests]}\n"
        # centers output
        puts strOut.lines.map {|line| line.strip.center(100)}.join("\n")

      end
    end
  end
end


=begin
# group by cohort
def print(students)
  listCohorts = students.group_by{ |x| x[:cohort] }
  puts listCohorts
    count = 0
    while count < listCohorts.length
      listCohorts.each_with_index do |cohort, index|
          puts "#{index + 1}. #{cohort[0]}"
          listCohorts[0].each do |cohort|
            puts cohort[0][:name]
          end
          count += 1
      end

    end
end



=begin
def print(students)
  count = 0
  while count < students.length
    students.each_with_index do |student, index|
        strOut = "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)\n\tHeight: #{student[:height]}\n\tPlace of birth: #{student[:birthplace]}\n\tInterests: #{student[:interests]}"
        puts strOut.lines.map {|line| line.strip.center(100)}.join("\n")
        count += 1
    end
  end
end
=end


=begin
def print(students)
  students.each_with_index do |student, index|
    if student[:name][0] == "V" && student[:name].length < 12
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end
=end

def print_footer(names)
  if names.length == 1
puts "Overall, we have #{names.count} great student"
  else
    puts "Overall, we have #{names.count} great students"
  end
end


students = input_students
print_header
print(students)
print_footer(students)


=begin
-----------------------------------------------------
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

print_header
print(students)
print_footer(students)


------------------------------------------------------
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

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print(names)
  names.each do |name|
    puts name
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

print_header
print(students)
print_footer(students)


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
