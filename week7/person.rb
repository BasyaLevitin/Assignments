class Person

  #attr_reader :alive
  attr_writer :deep_dark_secret
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @alive      = true
  end

  def full_name
    "#{ @first_name } #{ @last_name }"
  end

  def daydream
    @deep_dark_secret = 'I want pizza'
  end

  #WRITER
  # def first_name=(new_first_name)
  #   @first_name = new_first_name
  # end

  # # READERS
  # # def first_name
  # #   @first_name
  # # end
  # def last_name
  #   @last_name
  # end

end

me = Person.new("Harisree","Sreelatha")

puts me.inspect
puts me.full_name
puts me.daydream
puts me.last_name
puts me.first_name=("Sree")
puts "hi.......#{me.first_name}"
puts me.inspect
puts Person.daydream


you = Person.new("Steve","Jobs")

puts you.inspect