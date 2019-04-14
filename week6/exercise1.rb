# ## Exercise 1
# You want to add up your expenses for the year. Create an array of numbers (integers or floats) that represents your expenses, eg:

# `[250, 7.95, 30.95, 16.50]`

# Add up the numbers and output the result.

# Tip: you may need a variable to keep track of the sum total. What value should it start at?

# Put this code into a method. The method should take an array as an argument and return the sum of the expenses in the array. Call the method twice with different arrays.

    bills = [250, 7.95, 30.95, 16.50]
    money = [250, 7.95, 30.95, 16.50]
    total = 0
    bills.each {|e| total = total + e}

    p total

def findTotal(bills)
    total = 0
    bills.each {|e| total = total + e}
    return total
end
p findTotal(bills)
p findTotal(money)
