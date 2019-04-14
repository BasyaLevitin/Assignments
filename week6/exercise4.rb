
# ## Exercise 4

# You have three dogs and you want to keep track of them. Sometimes they like to dig under your fence and explore the neighbourhood.

# Your backyard is 10 metres deep. You need to call their name if they leave your backyard (ie. if their `position` is greater than 10).

# Create an array of dogs as follows:

# ```ruby
# my_dogs = [
#   { :name => 'Ralph', :position => 5 },
#   { :name => 'Cindy', :position => 8 },
#   { :name => 'Jade', :position => 11 },
# ]
# ```

# Notice that each 'dog' is actually a hash - a set of key value pairs. The two keys we need for each dog are :name and :position.

# 1. Figure out which dogs have left the backyard. Write a method called `get_absent_dogs` that takes an array of dogs (hashes) as an argument and returns an array of dogs (that are absent).

# 1. Call the dogs that are absent. Write a method called `call_absent_dogs`. It should take an array of dogs as an argument. It does not need to return anything, but should instead output the name of each dog that is missing. For example, for a dog named Izzy, `"Come back, Izzy!"`.
#   * How will this method know which dogs are absent?

# 1. Your neighbour has also asked you to watch over her dogs. Make another array of dogs. Add another array of dogs similar to the previous one. Call the method `call_absent_dogs` with each set of dogs.

# This problem emphasises the need to break down problems into smaller parts. Always try to solve one problem at a time.


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

# 1. Figure out which dogs have left the backyard. Write a method called `get_absent_dogs` that takes an array of dogs (hashes) as an argument and returns an array of dogs (that are absent).
# def get_absent_dogs(a) #a is a place holder here for what u will fill in later when u call it. 
#     dogs = []
#     a.each do |arrayItem|
#         if arrayItem[:position] > 10
#             dogs << arrayItem[:name]
#         end
#     end
#     return dogs
# end
            
  
 #try .select from exercise5 (instead of .each)

# get_absent_dogs(my_dogs)

# 1. Figure out which dogs have left the backyard. Write a method called `get_absent_dogs_msg` that takes an array of dogs (hashes) as an argument and returns an array of hashes for missing dogs with 2 keys 1) the name key which holds the name of absent dog 2) message key which hold a message like " come back Mr. name_of_the_dog"

    # [{:name=>"jade", :message=>"come back MR.jade"}]
   

def get_absent_dogs_msg(b)
   dog = []
   b.each do |arrayTrait|
    arrayTrait[:position] > 10
    dog << { :name=>"jade"
        :message=>"come back MR. jade" }
   end
end
end
return dog

end

p get_absent_dogs_msg(my_dogs)



        
