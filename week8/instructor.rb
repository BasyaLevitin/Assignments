require_relative 'human'
# require_relative 'child'

class Instructor < Human
    def teach
        puts "Everything in Ruby is an object."
    end
end

chris = Instructor.new("Chris")

# p chris.greeting
# p chris.teach