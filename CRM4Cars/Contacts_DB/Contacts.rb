gem 'activerecord', '=4.2.10'
require 'mini_record'
require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'Contacts.sqlite3')

class Contact < ActiveRecord::Base

    field :firstname, as: :string
    field :lastname, as: :string
    field :email, as: :string
    field :note, as: :string

end
Contact.auto_upgrade!

