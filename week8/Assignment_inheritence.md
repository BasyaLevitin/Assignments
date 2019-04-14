### Inheritance

Inheritance is a relation between two classes. We know that all cats are mammals, and all mammals are animals. The benefit of inheritance is that classes lower down the hierarchy get the features of those higher up, but can also add specific features of their own. If all mammals breathe, then all cats breathe. In Ruby, a class can only inherit from a single other class. Some other languages support multiple inheritance, a feature that allows classes to inherit features from multiple classes, but Ruby doesn't support this.

We can express this concept in Ruby - see `mammal.rb` program below:

```ruby
class Mammal
  def breathe
    puts "inhale and exhale"
  end
end

class Cat < Mammal
  def speak
    puts "Meow"
  end
end

rani = Cat.new
rani.breathe
rani.speak
```

### Class Hierarchy

A part of the class hierarchy is as shown in the figure below.

![!Wikipedia](http://rubylearning.com/images/rubyclass.jpg)

This diagram demonstrates that all objects inherit their methods from "Object".


## Exercise 1: Class Time

Create a file called **people.rb**. Run your program and commit your work after each step.

1. Let's start by creating two classes: one called Student and another called Instructor.
2. The student class has a method called **learn** that outputs "I get it!".
3. The instructor class has a method called **teach** that outputs "Everything in Ruby is an Object".
4. Both the instructor and the student have names. We know that instructors and students are both people. Create a parent Person class that contains the attribute **name** and an initializer to set the name.
5. Both the instructor and the student should also be able to do a greeting, like "Hi, my name is #{name}". Where's the best place to put this common method?
5. Create an instance of Instructor whose name is "Chris" and call his greeting.
6. Create an instance of Student whose name is "Cristina" and call her greeting.
7. Call the teach method on your instructor instance and call the learn method on your student. Next, call the teach method on your student instance. What happens? Why doesn't that work? Leave a comment in your program explaining why.

Once you're done, commit and push your work to GitHub!
