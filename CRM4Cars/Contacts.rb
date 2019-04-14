# 0
# 0 6 AdalegGIT/Contact_book
#  Code  Issues 0  Pull requests 0  Projects 0  Wiki  Insights
# Contact_book/contact.rb
# @harisree06 harisree06 adding the dummy code
# 6fb909c  on Jan 6
# 59 lines (38 sloc)  1.26 KB
    
class Contact
    
    attr_reader :id
    attr_accessor :first_name, :last_name, :email, :note
    @@contacts = []
    @@id = 1
#WHY DO U NEED BOTH THE READER AND ACCESSOR? ISNT THE READER INCLUDED IN THE ACCESSOR?sometimes u dont want someone outside of the class to access an attribute- u dont want them to change it. 

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id = @@id + 1
  end



#   def email
#     @email
#   end

#   def note=(note)
#     @note = note
#   end
# end


# contact.note = 'Betty loves buying blue bows before baking bagels'
#WHY DIDNT CONTACT.NOTE WORK WITH THE INSTANCE METHOD?
# p contact.note 


  # This method should call the initializer, 
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name,last_name,email,note)
    @@contacts << new_contact
    return new_contact
  end


#   end

#   # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

#   # This method should accept an id as an argument
#   # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
        if contact.id == id
            return contact
        end
        end
    end


#   # This method should allow you to specify 
#   # 1. which of the contact's attributes you want to update
#   # 2. the new value for that attribute
#   # and then make the appropriate change to the contact
  def update(attribute,value)
    if attribute == "firstname"
        self.first_name = value
        return value
    end

    if attribute == "lastname"
        self.last_name = value
        return value
    end

    if attribute == "email"
        self.email = value
        return value
    end

    if attribute == "note"
        self.note = value
        return value
    end
 end


#   # This method should work similarly to the find method above
#   # but it should allow you to search for a contact using attributes other than id
#   # by specifying both the name of the attribute and the value
#   # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute,value)
    @@contacts.each do |contact|
    if attribute == "firstname"
        if contact.first_name == value
            return contact
        end
    end

    if attribute == "lastname"
        if contact.last_name == value
            return contact
        end
    end

    if attribute == "email"
        if contact.email == value
            return contact
        end
    end

    if attribute == "note"
        if contact.note == value
            return contact
        end
     end
 end
end



#   # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end


  def full_name
    puts "#{first_name} #{last_name}"
  end


#   # This method should delete the contact
#   # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self) 
  end

end

#   # Feel free to add other methods here, if you need them.
  
# end
# tina = Contact.create("Tina","Belcher","JimmyJr@gmail.com","I dont need a boy to pay attention to me. Ill pay attention to myself.")
# louise = Contact.create("Louise","Belcher","BunnyEars@gmail.com","You could sell your soul. I did, and look at me!")

# p Contact.find(1)

# p tina.update("firstname","Flower Power Tina")

# p Contact.find_by("note", "I dont need a boy to pay attention to me. Ill pay attention to myself.")

# p Contact.all

