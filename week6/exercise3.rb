# ## Exercise 3

# Create a file named **exercise10.rb**.

# Don't forget to try running your code after each step, and to commit frequently as you work!

# 1. Start out by creating the following hash representing the number of students in a cohorts:

#     ```ruby
#     students = {
#       :cohort1 => 34,
#       :cohort2 => 42,
#       :cohort3 => 22
#     }
#     ```

# 2. Create a method that displays the name and number of students for each cohort, like so:

#     ![](http://cl.ly/image/130n421x3C3H/Screen%20Shot%202013-10-22%20at%2012.32.59%20AM.png)
# 3. Add cohort 4, which had 43 students, to the hash.
# 4. Use the `keys` method to output all of the cohort names.
# 5. The classrooms have been expanded! Increase each cohort size by 5% and display the new results.
# 6. Delete the 2nd cohort and redisplay the hash.
# 7. BONUS: Calculate the total number of students across all cohorts using `each` and a variable to keep track of the total. Output the result.
# 8. BONUS: Create another similar hash called `staff` and display it using the same method.

a=["rr","eeeee"]


students = {
          :cohort1 => 34, 
          :cohort2 => 42, 
          :cohort3 => 22
        }

# p students.keys








        # staff = {
        #   :cohort1 => 34, 
        #   :cohort2 => 42, 
        #   :cohort3 => 22
        # }

# students[:cohort4] = 43 

#3 (If I want to include the new cohort in the method it MUST be before method)
# students.each do |k, v|
#     puts "#{k}: #{v} students"
# end

# p students.keys



#5
# students.each do |k, v| 
#     v = v*1.05
#     puts "#{k}: #{v} students"
# end




# students[:cohort4] = 43 
#3 (look above)
# p cohort(students) is this valid code??

# 6. Delete the 2nd cohort and redisplay the hash.
# students.delete(:cohort2)
# puts "-----"

# p students



# students#7
# total = 0
# students.each do |k, v|
#     total = total + v
# end

# p total

#     studentTotal#7

#  # 8. BONUS: Create another similar hash called `staff` and display it using the same method.

#8

# staff = {}
# students.each do |k, v|
#     staff[k] = v 
# end
 
# students.each do |k, v| 
    
#     if v > 30
#         staff[k] = v  
#     end   
# end


# def display(h)
#      p h
# end

# display(staff)