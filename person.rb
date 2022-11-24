# Create a person class
class Person
  def initialize(id, age, name = 'Unknown', parent_permission: true)
    @id = id
    @age = age
    @name = name
    @parent_permission = parent_permission
  end
  # setters and getters
  attr_accessor :name, :age
  attr_reader :id

  # Private method
  private

  def of_age?
    @age >= 18
  end

  # Public method
  def can_use_services?
    is_of_age? || @parent_permission
  end
end
