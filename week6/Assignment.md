# Arrays

An array is a Ruby data type that holds an ordered collection of values, which can be any type. Ruby arrays can be created with either "literal notation" or the `.new` method.

Example using literal notation:
```ruby
x = [1, 2, 3, 4]
y = ["carrots", "apples"]
x
=> [1, 2, 3, 4]
y
=> ["carrots","apples"]

y.push("cartoon foxes")
y
=> ["carrots", "apples", "cartoon foxes"]
```

Example using `.new`:

```ruby
z = Array.new(3, "Matz!")
z # ["Matz!", "Matz!", "Matz!"]
```

Let's explore properties of arrays by typing each one of the following in **irb**. Avoid copy-and-pasting!

`["green", "purple", "orange"].class`

`["green", "purple", "orange"].length`

`[1, 15, 7, 4].class`

`["hello", 7, true].length`

`[].class`

Let's do some more by making an array called `colours`:

`colours = ["green", "purple", "orange"]`

`colours.class`

`colours.length`

`colours[2]`

`colours[2].class`

`colours[0].upcase`

`colours[3]`

`colours[2] = "yellow"`

`colours`

Now let's put a bunch of greetings into an array and play around with them:

`greeting = "hello"`

`greetings = [greeting, "hi", "what's up?"]`

`greetings[0]`

`greetings[1]`

`number = 2`

`greetings[number]`

Finally, let's explore another way to build arrays:

`Array.new`

`z = Array.new(3, "Matz!")`

`z[0]`

So, what does this tell us?
* Arrays are delimited with square brackets (`[...]`), similar to how quotation marks delimit a string
* Each object within an array is separated by a comma
* Arrays can hold objects of any type, even multiple types in the same array
* Arrays have a `length` method, which does what you'd expect
* We can access individual objects within an array by using square brackets and **indices**. Ruby arrays are zero-indexed, which means the first element's index is always 0.
* If we try to access an array index which doesn't exist, it returns `nil`
* We can also initialize an array with `Array.new`

## Array methods

Just like other types of objects, arrays have all sorts of methods. We've already seen `.class`, `.push`, and `.length`. You can of course see a full list in the [Ruby documentation](http://ruby-doc.org/core-2.3.0/Array.html). Let's try a few in irb:

`colours = ["red", "purple", "pink"]`

`colours.length`

`colours << "blue"`

`colours.length`

`colours`

`colours << "orange"`

`colours.join`

`colours.join.class`

`colours.join(", ")`

`[4, 7, 12].join("-")`

`colours.include?("purple")`

`colours.include?("yellow")`

`colours.sort`

`grades = [87, 65, 90, 77]`

`grades.length`

`grades.max`

`grades.min`

`[1, 2, "hello"].min`

What did we learn?
* We can add elements to the end of an array using `<<`, aka the "shovel" operator
* The array's `join` method converts an array into a string, and optionally accepts another string as an argument that will be used to separate each item from the array
* The array's `include?` method accepts an object and returns a boolean value (true or false)
* Arrays have `min` and `max` methods, however they require all elements of the array to be the same data type

Click on the link above to the `Array` class and take a look at the documentation for the methods that we tried out.


## Exercise 1
You want to add up your expenses for the year. Create an array of numbers (integers or floats) that represents your expenses, eg:

`[250, 7.95, 30.95, 16.50]`

Add up the numbers and output the result.

Tip: you may need a variable to keep track of the sum total. What value should it start at?

Put this code into a method. The method should take an array as an argument and return the sum of the expenses in the array. Call the method twice with different arrays.

## Exercise 2
We're going to make a shopping list by storing a few items in an array. Feel free to start with whatever items you like:

```ruby
grocery_list = ["carrots", "toilet paper", "apples", "salmon"]
```

After each step, run your program to ensure it works before you move onto the next one. It's a good idea to commit often, too.

1. Your next step should present your grocery list with an item on each line, with an **asterisk** (*) in front of it so that it appears like this:

![](http://cl.ly/image/111T2X2r3t2d/Screen%20Shot%202013-10-21%20at%2011.44.52%20PM.png)
1. You realize you've forgotten some rice, so add it to your list and output it again. Given that you've already output your list twice, it might be good to consider writing a method to do this. Putting frequently used chunks of code in a method lets you reuse them throughout your program without having to type them out over and over.
1. You lost count of how many things you need to pick up. Better output the total number of items on your list.
1. Check to see if your list includes "bananas". If it does, output "You need to pick up bananas". Otherwise, output "You don't need to pick up bananas today".
1. Display the second item in the list. (Don't forget that arrays indices start at zero!)
1. It turns out that everything in this grocery store you're visiting is stored alphabetically, so to better plan out what you need to buy you should sort your grocery list and output it with asterisks again.
1. After looking everywhere, you can't find the salmon. Delete it from your list and redisplay the list one last time.

After you're done, be sure you have everything committed and pushed to your github repo.


# Hashes

Hashes are collections of key-value pairs. Like arrays, they have values associated with indices, but in the case of hashes the indices are called **keys**. Instead of referring to the position of a specific value, keys act more like labels for the values in your hash.  Keys can be many different data types, including integers, float, and strings.  Symbols are the type most often used as hash keys. The values to which keys refer can be any Ruby object.

Why would we want key-value pairs? Think about the dictionary. You use them when you want to know the definition of a word, so you look up the word 'transcendent' in the dictionary to get the definition. The key is the word 'transcendent' and the value is the definition. It turns out that we want to do this kind of thing very often in programming.

The syntax for creating a new hash is like so:
```ruby
my_hash = {
  :key1 => "First value!",
  :key2 => "Second value!",
  :key3 => "Third value!"
}
```

The **keys** of this new hash are the symbols `:key1`, `:key2`, and `:key3`.  The **values** are the strings `"First value!"`, `"Second value!"`, and `"Third value!"`.

Note the curly braces (`{}`) as well as this funky new `=>` symbol, which Rubyists refer to as a **hash rocket**.

You retrieve a value from a hash by writing its key in square brackets.  You can also add new keys and values to an existing hash using square brackets:

```ruby
my_hash = {
  :key1 => "First value!",
  :key2 => "Second value!",
  :key3 => "Third value!"
}

my_hash[:key4] = "Fourth value!"
my_hash[:key4] # "Fourth value!"

my_hash[:key2] # "Second value!"
my_hash[:key5] # nil
```

As the last line in the above example illustrates, if you try to refer to a key that doesn't exist the result will be `nil`. Hashes can also be initialized with the `.new` method, which optionally accepts a parameter that will be used as the default value for undefined keys instead of `nil`:

```ruby
hash1 = Hash.new
hash1 # {}

hash1[:some_key] # nil

hash2 = Hash.new("banana")
hash2 # {}
hash2[:some_key] # "banana"
```

Why might we want to use a default value for a hash? Imagine you run a table tennis tournament each week, but a player is eliminated after 2 losses instead of 1. In that case, then, let's say we want to see how many losses the user `Carrie` has left. If she hasn't lost yet, we'd want the value to be `2`.


```ruby
strikes = {}
strikes['Carrie'] # returns nil, which is not what we wanted

strikes = Hash.new(2)
strikes['Carrie'] # returns 2, meaning she hasn't yet lost

strikes['Sally'] -= 1 # returns 1, because that was Sally's first loss
strikes['Sally'] -= 1 # returns 0, because that was Sally's second loss
strikes['Sally']  # 0

```

Now we only have to keep track of people who have lost games, rather than everybody! Everyone else automatically has 2 losses remaining.

Let's try using the `.each` method from yesterday to loop through the contents of a hash:

```ruby
my_hash = {
  :key1 => "First value!",
  :key2 => "Second value!",
  :key3 => "Third value!"
}

my_hash.each do |k, v|
  puts "The key is #{k} and the value is #{v}"
end

# The key is key1 and the value is First value!
# The key is key2 and the value is Second value!
# The key is key3 and the value is Third value!
```

As you can see, when iterating over a hash two block arguments are used instead of one.  As we iterate over the key-value pairs in our hash the first block argument (called `k` in this example) will contain the key and the second block argument (called `v` in this example) will contain the value.

## Exercise 3

Create a file named **exercise10.rb**.

Don't forget to try running your code after each step, and to commit frequently as you work!

1. Start out by creating the following hash representing the number of students in a cohorts:

    ```ruby
    students = {
      :cohort1 => 34,
      :cohort2 => 42,
      :cohort3 => 22
    }
    ```

2. Create a method that displays the name and number of students for each cohort, like so:

    ![](http://cl.ly/image/130n421x3C3H/Screen%20Shot%202013-10-22%20at%2012.32.59%20AM.png)
3. Add cohort 4, which had 43 students, to the hash.
4. Use the `keys` method to output all of the cohort names.
5. The classrooms have been expanded! Increase each cohort size by 5% and display the new results.
6. Delete the 2nd cohort and redisplay the hash.
7. BONUS: Calculate the total number of students across all cohorts using `each` and a variable to keep track of the total. Output the result.
8. BONUS: Create another similar hash called `staff` and display it using the same method.

After you're done, be sure you have committed and pushed everything to your Github repo.


# Stretch Exercises

## Exercise 4

You have three dogs and you want to keep track of them. Sometimes they like to dig under your fence and explore the neighbourhood.

Your backyard is 10 metres deep. You need to call their name if they leave your backyard (ie. if their `position` is greater than 10).

Create an array of dogs as follows:

```ruby
my_dogs = [
  { :name => 'Ralph', :position => 5 },
  { :name => 'Cindy', :position => 8 },
  { :name => 'Jade', :position => 11 },
]
```

Notice that each 'dog' is actually a hash - a set of key value pairs. The two keys we need for each dog are :name and :position.

1. Figure out which dogs have left the backyard. Write a method called `get_absent_dogs` that takes an array of dogs (hashes) as an argument and returns an array of dogs (that are absent).

1. Call the dogs that are absent. Write a method called `call_absent_dogs`. It should take an array of dogs as an argument. It does not need to return anything, but should instead output the name of each dog that is missing. For example, for a dog named Izzy, `"Come back, Izzy!"`.
  * How will this method know which dogs are absent?

1. Your neighbour has also asked you to watch over her dogs. Make another array of dogs. Add another array of dogs similar to the previous one. Call the method `call_absent_dogs` with each set of dogs.

This problem emphasises the need to break down problems into smaller parts. Always try to solve one problem at a time.

## Exercise 5

*This exercise is more advanced, and should only be tackled if you are comfortable with `.each`.*

Let's learn more about arrays! We've been iterating over arrays using `my_array.each`. This is okay, but sometimes there are more specific ways to iterate.

Take a look at [`select`](https://ruby-doc.org/core-2.2.0/Array.html#method-i-select). It allows you to filter down an array by some condition.

1. Refactor the `get_absent_dogs` method from [Exercise 4](#exercise-4) to use the `select` method instead of `each`.

Now let's look at [`map`](https://ruby-doc.org/core-2.2.0/Array.html#method-i-map) (the same as `collect`). Given an array, it will return a new array with the same number of items, where each item has had some kind of operation performed on it. Example:

```ruby
numbers = [1, 2, 3, 4, 5]
new_numbers = numbers.map do |num|
  num * 2
end
puts new_numbers # [2, 4, 6, 8, 10]
```

1. Your dogs all see a squirrel and chase it. Increase their position values by 5 using `Array.map!`.
  * Note that `.map!` will modify the array you are using (presumably `my_dogs`) rather than returning a new one with `.map`.

1. Now create a method called `chase_squirrel` that handles this. It should take an array of dogs as an argument and add 5 to the position of each dog.

1. Write a new method called `return_dogs` that takes an array of dogs as an argument. It should reset all of the dogs' positions back to 0.


# Further Resources

There's lots to learn! Feel free to check out these resources to deepen your knowledge. These are the building blocks of Ruby and with a good foundation and understanding of them, you will be well on your way to writing more and more complex programs!

### Code exercises
* [Ruby Koans](http://rubykoans.com/)
* [Ruby Monk](http://rubymonk.com/learning/books/1-ruby-primer)
* [Rubeque](http://www.rubeque.com/problems)
* [Exercism.io](http://www.exercism.io/)
* [Code Wars](https://www.codewars.com/)
* [Code Academy](https://www.codecademy.com/learn/ruby)
