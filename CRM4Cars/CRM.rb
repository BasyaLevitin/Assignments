require_relative 'contacts'
class CRM

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
        puts '[1] Add a new contact'
        puts '[2] Modify an existing contact'
        puts '[3] Delete a contact'
        puts '[4] Display all the contacts'
        puts '[5] Search by attribute'
        puts '[6] Exit'
        puts 'Enter a number:'
    end
  
    def call_option
        (user_selected)
        case user_selected
        when 1 then
        add_new_contact
        when 2 then
        modify_existing_contact
        when 3 then
        delete_a_contact
        when 4 then
        display_all_contacts
        when 5 then 
        search_by_attribute
        when 6 then 
        exit(true)
        end
    end
  
    def add_new_contact
        print 'Enter First Name: '
        first_name = gets.chomp

        print 'Enter Last Name: '
        last_name = gets.chomp

        print 'Enter Email Address: '
        email = gets.chomp

        print 'Enter a Note'
        note = gets.chomp

        Contact.create(first_name, last_name, email, note)
    end
  
    def modify_existing_contact
        p "Please enter the id of the contact to be modified"
        answer = gets.chomp.to_i
        contact = nil
        test = Contact.find (answer)

        if test != nil
            p "Please enter the attribute you want to modify:"
            attribute = gets.chomp "Please enter the new value for #{attribute}:"
            value = gets.chomp

            if test.update(attribute,value)
                p "Contact updated!!"
            end
        else
            p "Contact not found"
        end
    end
  
    def delete_contact
        puts "Enter the id of the contact u want to delete"
        ans = gets.chomp.to_i
        contact_to_delet = Contact.find(ans)
        contact_to_delet.delete
    end
  
    def display_all_contacts
      p Contact.all
    end
  
    def search_by_attribute
        puts "Enter the attribute u want to search"
        attribute = gets.chomp
        puts "Enter the value of the #{attribute}"
        value = gets.chomp
        p Contact.find_by(attribute,value)
    end 
  end
  

  crm = CRM.new
  crm.main_menu

