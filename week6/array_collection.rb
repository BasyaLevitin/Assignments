# my_first_array = ['apples', 'oranges', 'music']

# len = my_first_array.length

# puts my_first_array[len-1]

# puts my_first_array[-1]

# my_array = []

# #puts my_first_array[2]

# my_first_array << 'songs'

# puts my_first_array
# puts "-----------------------------------------"
#  puts my_first_array.pop
#  puts "-----------------------------------------"
# puts my_first_array

# my_first_array.delete('apples')

# puts "-----------------------------------------"

# puts my_first_array

# my_first_array.delete_at(1)

# puts "-----------------------------------------"

# puts my_first_array

# my_number_array = [20,33,44,11,77,33,10] #[25,38,49,16,82,38,15]

# my_new_array =[]

# my_number_array.each do |number|
#    puts "..................#{number}"
#    my_new_array <<  number+5
#    puts "*************************************************#{my_new_array}"
# end

#puts my_new_array

# nested_array = [ [1, 2, 3], [4, 5, 6],[7, 8, 9], [0]]

# nested_array.each do |item|

#     item << 20

# end

# nested_array[0][0] = 5


# p nested_array



#info = ['abc', 'abc','abc@gmail.com']
info = {
    :first_name => "xxxxxxx",
    :last_Name => "xxxxxxxxxxxx",
    :email => "abc@gmail.com"
}

# info["postal_code"] = "MMMMMM"
info = {
    :first_name => "xxxxxxx",
    :last_Name => "xxxxxxxxxxxx",
    :email => "abc@gmail.com"
}

p info.keys

p info.values

p info[:first_name]