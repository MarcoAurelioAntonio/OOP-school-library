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
  end
  # setters and getters
  attr_accessor :name, :age
  attr_reader :id

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

person = Person.new(22, 'maximilian    ')
p person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name

# if the word plus the spaces is grader of 10, makes the trimm
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmed_person.correct_name
