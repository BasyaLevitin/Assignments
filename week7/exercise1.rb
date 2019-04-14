# ## Exercise 1: Bank Account

# 1. Create a `BankAccount` class
# 2. Every bank account should have `balance` and `interest_rate` attributes
#   * At this point you should test out creating an instance of your class to make sure it works
# 3. Your class should have an instance method called `deposit` that accepts one `amount` argument and adds that amount to the total balance
#   * Test out your method by calling it on an instance of your class
# 4. There should be a `withdraw` instance method that accepts one `amount` argument and subtracts it from the total balance
#   * Don't forget to test it out!
# 5. Finally, there should be a `gain_interest` instance method that increases the total balance according to the interest rate.

# Once all of that is working, don't forget to commit!

class BankAccount

    def initialize(balance)
        @balance = balance
        @interest_rate = 0.5
    end

    def deposit(a)
        @balance = @balance + a
    end

    def withdraw(a)
        if a > @balance
            puts "You have insufficient funds"
        else
        @balance = @balance - a
        end
    end

    def gain_interest
        @balance = @balance + @balance * @interest_rate 
    end
end

peppa = BankAccount.new(500)
peppa.deposit(100)
# peppa.withdraw(4000)
peppa.gain_interest

p peppa

