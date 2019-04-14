# #Exercise 1
# Think of a book, a film, a recipe, and a song. Store the titles of these in variables. Ask the user if they enjoy 1. reading books 2. watching films 3.trying new recipes. If they answer yes to books, display a message recommending the book to them. If they answer no to books but yes to films and recipes, recommend them the song. If they answer yes to only films, recommend the film. If they say yes to only recipe, recommend the recipe. If they answer no to all three, recommend a good restaurant instead.




Def hobbies(books,songs,films,recipes)
    if answer = books
        puts "Then I recommend #{books}"
    elsif answer = films && recipes
            puts "Then I recommend #{songs}"
    elsif answer = films
                puts "Then I recommend #{films}"
    elsif answer = recipe
                    puts "Then i recommend #{recipes}"
                else
                     puts "I recommend that you go to eat out at the resuaurant La Marais"
            end
            return hobbies
 end   
        
Def brings_you_joy(books, films, recipes, songs)
    puts "Do you enjoy reading books, watching films or trying new recipes?"
    if books = "A Thousand Splendid Suns"
        books = gets.chomp
    elsif films = "The Kings Speech"
        films = gets.chomp
    elsif recipes == "Pumpkin Ravioli"
        recipes = gets.chomp
    elsif songs == "Bohemian Rapsody"
        songs = gets.chomp
    end
    return hobbies
end
 

    


puts "Then I recommend "{hobbies(brings_you_joy)} "
