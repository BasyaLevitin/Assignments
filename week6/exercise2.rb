
# ## Exercise 2
# We're going to make a shopping list by storing a few items in an array. Feel free to start with whatever items you like:

# ```ruby
# grocery_list = ["carrots", "toilet paper", "apples", "salmon"]
# ```

# After each step, run your program to ensure it works before you move onto the next one. It's a good idea to commit often, too.

# 1. Your next step should present your grocery list with an item on each line, with an **asterisk** (*) in front of it so that it appears like this:

# ![](http://cl.ly/image/111T2X2r3t2d/Screen%20Shot%202013-10-21%20at%2011.44.52%20PM.png)
# 1. You realize you've forgotten some rice, so add it to your list and output it again. Given that you've already output your list twice, it might be good to consider writing a method to do this. Putting frequently used chunks of code in a method lets you reuse them throughout your program without having to type them out over and over.
# 1. You lost count of how many things you need to pick up. Better output the total number of items on your list.
# 1. Check to see if your list includes "bananas". If it does, output "You need to pick up bananas". Otherwise, output "You don't need to pick up bananas today".
# 1. Display the second item in the list. (Don't forget that arrays indices start at zero!)
# 1. It turns out that everything in this grocery store you're visiting is stored alphabetically, so to better plan out what you need to buy you should sort your grocery list and output it with asterisks again.
# 1. After looking everywhere, you can't find the salmon. Delete it from your list and redisplay the list one last time.

# After you're done, be sure you have everything committed and pushed to your github repo.

junk_shopping = ["gushers", "pas donuts", "choclatty peanut butter balls", "watermelon tangy taffies"]

junk_shopping << "midol"

def wrap_text(s, j) bananas = 0 
    counter = 0
    j.each do |e|
        counter = counter + 1
        puts "#{s} #{e}"
    end
    puts "We got #{counter} snacks to binge on."
end


def got_bananas(junk_shopping) 
    bananas = 0
    junk_shopping.each do |e|
        if bananas == e 
            bananas = banans + 1
        end
    end
    if bananas > 0
        puts "We go enough bananas, please don't buy any more"
    else 
        puts "We are desparate for bananas, please buyyyy!"
    end
end


# got_bananas(junk_shopping)

# p junk_shopping[1]


# def delete("gushers")



# p junk_shopping.sort
# p wrap_text("*", junk_shopping.sort)

def delete(a,j)
    j.each_with_index do |item,index|
    if item == a
        j.delete_at(index)
     end
    end
return j
end
  
p delete("gushers", junk_shopping)

# junk_shopping.delete_at("salmon")
# p junk_shopping