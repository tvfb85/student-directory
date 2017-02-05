# 'Quine' - a program that prints its own source code, usually to the standard output.
# The following line calls the read method on the current file:
puts File.read(__FILE__)

# Additional notes:

# prints the current filename
puts __FILE__
# prints the directory name of the file which is passed as an argument
puts File.dirname(__FILE__)
# prints the name of the file which is passed as an argument
puts File.basename(__FILE__)
