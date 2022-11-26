require './nameable'
require './decorator'

# Create a person class
class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end
  # setters and getters
  attr_accessor :name, :age
  attr_reader :id

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def add_rental(book, date)
    @rentals << Rental.new(date, book, self)
  end

  def add_full_rental(rental)
    @rentals << rental
  end

  # Public method
  def can_use_services?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  # Private method
  private

  def of_age?
    @age >= 18
  end
end
