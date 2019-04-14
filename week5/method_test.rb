
# def greet(name)
#     puts "Welcome #{name} ! Have a nice day"
# end

#WHY THE BREAKS?
# puts "---------------"
# greet("Sarah")
# puts "Hello abc"
# greet("abc")
# puts "Hello xyz"
# # greet

# puts "-------------------"
# student = "Jay"
# greet(student)
# name = "Mike"
# greet(name)
# puts "helloooooo......"


def personal_info(mark1, mark2, mark3)
    total_marks = mark1 + mark2 +mark3
    if total_marks >= 200
        grade = "A+"
    elsif total_marks >= 100
        grade = "B+"
    else
        grade = "C"
    end  

    return grade
 
end

puts "mark calculator"

#Why does it say "mark calculator"? Isn't return going to do the job? Answer: mark calculator is just a message to let the user know what is happening next.

# 3.times do

def ask_details
puts "Enter the name of student"
name = gets.chomp
puts "enter mark 1"
mark1 = gets.chomp.to_i
puts "enter mark 2"
mark2 = gets.chomp.to_i
puts "enter mark 3"
mark3 = gets.chomp.to_i
grade = personal_info(mark1, mark2, mark3) 
#Why do we have to write this? Isn't this already said?
puts "total grade  of #{name} is #{grade}"
end
end

ask_details