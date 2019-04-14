
# ## Exercise 5

# *This exercise is more advanced, and should only be tackled if you are comfortable with `.each`.*

# Let's learn more about arrays! We've been iterating over arrays using `my_array.each`. This is okay, but sometimes there are more specific ways to iterate.

# Take a look at [`select`](https://ruby-doc.org/core-2.2.0/Array.html#method-i-select). It allows you to filter down an array by some condition.

# 1. Refactor the `get_absent_dogs` method from [Exercise 4](#exercise-4) to use the `select` method instead of `each`.

# Now let's look at [`map`](https://ruby-doc.org/core-2.2.0/Array.html#method-i-map) (the same as `collect`). Given an array, it will return a new array with the same number of items, where each item has had some kind of operation performed on it. Example:

# ```ruby
# numbers = [1, 2, 3, 4, 5]
# new_numbers = numbers.map do |num|
#   num * 2
# end
# puts new_numbers # [2, 4, 6, 8, 10]
# ```

# 1. Your dogs all see a squirrel and chase it. Increase their position values by 5 using `Array.map!`.
#   * Note that `.map!` will modify the array you are using (presumably `my_dogs`) rather than returning a new one with `.map`.

# 1. Now create a method called `chase_squirrel` that handles this. It should take an array of dogs as an argument and add 5 to the position of each dog.

# 1. Write a new method called `return_dogs` that takes an array of dogs as an argument. It should reset all of the dogs' positions back to 0.


my_dogs = [
  { :name => 'Ralph', :position => 5 },
  { :name => 'Cindy', :position => 8 },
  { :name => 'Jade', :position => 11 },
]

# my_neighbors_dogs = [
#   { :name => 'Bogie', :position => 15 },
#   { :name => 'Princess', :position => 4 },
#   { :name => 'Spoton', :position => 20 },
# ] #2
# def get_absent_dogs(a,b)
#     b.select do {|e| e = name}
#         if a > 10 
#             # puts "Which dog are you looking for?"
#             # name = gets.chomp
#             puts "Come back #{name}!"  
#         end     
#     end
# end #try .select from exercise5 (instead of .each)

def chase_squirrel(b)
    b.map {|e| {:name => e[:name], :position => e[:position] > 5? e[:position] + 5:e[:position]}}
end

def return_dogs(b)
    b.map {|e| {:name => e[:name], :position => 0}}
end

p return_dogs(my_dogs)

# def return_dogs(my_dogs)
#     position == 0
#     my_dogs.select do {|e| e > 10} 
#         puts "#{name}'s position is 0 away"
#     end
# end

# return_dogs



   


# p get_absent_dogs(my_dogs)
# p Array.map(my_dogs)