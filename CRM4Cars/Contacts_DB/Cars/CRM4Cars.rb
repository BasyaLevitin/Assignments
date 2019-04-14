require_relative 'Cars'

class CRM4Cars

    def initialize
    end

    def main_menu
        while true
        print_main_menu
        user_selected = gets.to_i
        call_option(user_selected)
        end
    end

    def print_main_menu
        puts "[1] Add New Car"
        puts "[2] Modify Existing Car"
        puts "[3] Delete a Car"
        puts "[4] Display All Cars"
        puts "[5] Search By Attribute"
        puts "[6] Exit"
        puts "Enter a Number"
    end

    def call_option
        case user_selected
        when 1 then
            add_new_car
        when 2 then 
            modify_existing_car
        when 3 then
            delete_car
        when 4 then 
            display_all_cars
        when 5 then
            search_by_attribute
        when 6 then
            exit (true) 
        end 
    end

    def add_new_car
        puts "Enter the company name"
        company_name = gets.chomp

        puts "Enter the car color"
        color = gets.chomp

        puts "Enter you experience"
        experience = gets.chomp

        puts "Enter rating"
        rating = gets.to_i

        Car.create(companyname: company_name, color: color, experience: experience, rating: rating)
    end

    def modify_existing_car
        p "Please enter the id of the car you want to modify:"
        id = gets.chomp.to_i
        car = nil
        test = Car.find (answer)

        if test !nil
            p "Enter the attribute you want to modify"
            attribute = gets.chomp 
            p "Please enter the new value for the attribute:"
            value = gets.chomp

        if test.update(attribute,value)
            p "Car updated! "
        end
    else
        p "Car not found."
    end
    end

    def delete_car
        p "What is the id number of the car you want to delete"
        answer = gets.chomp.to_i
        car_to_delet = Car.find(ans)
        car_to_delet.delete
    end

    def display_all_cars
        p car.all
    end

    def search_by_attribute
        puts "Enter the attribute you want to search"
        attribute = gets.chomp
        puts "Enter the value of the attribute" 
        value = gets.chomp
        p Cars.find_by(attribute,value)
    end
end

  
crm4 = CRM4Cars.new
crm4.main_menu



        




