@students = []


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create the empty array
  # students = []
  # get the first name
  name = STDIN.gets.chomp.to_sym
  # checks the user has entered a student
    if name.empty?
      puts "Nothing entered. Try again."
      input_students
    else
  # while the name is not empty, repeat this code
  while !name.empty? do
    #get user input for cohort value
    puts "Please enter the cohort (month): "
    cohort = STDIN.gets.chomp
      if cohort.empty?
        cohort = :February
      end
    # convert cohort user input to symbol
    # cohort = cohort.to_sym
    # asking for more user input
    puts "Enter height: "
    height = STDIN.gets.chomp
    puts "Enter place of birth: "
    birthplace = STDIN.gets.chomp
    puts "Enter interests: "
    interests = STDIN.gets.chomp
    # add the student hash to the array
    add_students_hash({name: name, cohort: cohort.to_sym, height: height, birthplace: birthplace, interests: interests})
    if @students.length === 1
      puts "Now we have #{@students.count} student. Enter a new name, or press return to finish."
    else
      puts "Now we have #{@students.count} students. Enter a new name, or press return to finish."
    end
    # get another name from the user
    name = STDIN.gets.chomp
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
  index = 1
  # iterate over each cohort
  grouped.each do |cohort|
    if @current.nil? || @current != cohort[:cohort]
      puts "The students for the #{cohort[:cohort]} cohort are:".center(100)
      index = 1
    end
    @current = cohort[:cohort]
    strOut = "#{index}. #{cohort[:name]} (#{cohort[:cohort]} cohort)\n\Height: #{cohort[:height]}\n\tBorn: #{cohort[:birthplace]}\n\tInterests: #{cohort[:interests]}\n"
    puts strOut.lines.map {|line| line.strip.center(100)}.join("\n")
    index += 1


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
  puts "3. Save list to file"
  puts "4. Load list from file"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  puts "Selection successful..."
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    puts "Enter filename: "
    @user_filename = gets.chomp
        puts "Students were successfully saved to file."
    save_students
  when "4"
    puts "Enter filename: "
    @user_filename = gets.chomp
        puts "Students were successfully loaded from file."
    load_students(@user_filename)
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def save_students
  # open the file for writing
  File.open(@user_filename, "w") do |file|
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  #file.close
end
end

def load_students(filename = "students.csv")
  File.open(filename, "r") do |file|
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
  add_students_hash({name: name, cohort: cohort.to_sym})
  end
end
  #file.close
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    filename = "students.csv"
  end
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{@filename} doesn't exist."
    exit
  end
end

def add_students_hash(student_info)
  @students << (student_info)
end

def interactive_menu
# students = []
  loop do
    #1. print the menu and ask the user what to do
    print_menu
    #2. read the input and save into a variable
    process(STDIN.gets.chomp)
    #3. do what user asked
  end
end

try_load_students
interactive_menu
