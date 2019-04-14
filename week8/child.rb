require_relative 'instructor'
require_relative 'human'

class Child < Human

    def learn
        puts "I get it!"
    end
end

cristina = Child.new("Cristina")

# p cristina.greeting
# p cristina.learn
p cristina.teach

# 'cristina.teach' did not work because it an instance method, not a class method?