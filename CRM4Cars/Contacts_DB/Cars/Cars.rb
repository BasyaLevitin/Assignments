gem 'activerecord', '=4.2.10'
require 'mini_record'
require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'Cars.sqlite3')

class Cars < ActiveRecord::Base

    field :company, as: :string
    field :design, as: :string
    field :experience, as: :string
    field :rating, as: :integer

end

Cars.auto_upgrade!