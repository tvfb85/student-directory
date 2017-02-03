@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create the empty array
  # students = []
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
    @students << { name: name, cohort: cohort, height: height, birthplace: birthplace, interests: interests}
    if @students.length === 1
      puts "Now we have #{@students.count} student. Enter a new name, or press return to finish."
    else
      puts "Now we have #{@students.count} students. Enter a new name, or press return to finish."
    end
    # get another name from the user
    name = gets.chomp
  end

  # return the array of students
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end


# using map() to group by cohort
def print_students_list
  # sort the students hash by cohort
  grouped = @students.sort_by{|student| student[:cohort]}
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
def print(students)
  students.each_with_index do |student, index|
    if student[:name][0] == "V" && student[:name].length < 12
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end
=end

def print_footer()
  if @students.length == 1
puts "Overall, we have #{@students.count} great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

=begin
students = input_students
print_header
print(students)
print_footer(students)
=end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
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
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end


def interactive_menu
# students = []
  loop do
    #1. print the menu and ask the user what to do
    print_menu
    #2. read the input and save into a variable
    process(gets.chomp)
    #3. do what user asked
  end
end

interactive_menu
