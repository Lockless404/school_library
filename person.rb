require_relative './corrector'

class Person
  attr_reader :id
  attr_accessor :name, :age, :rental

  def initialize(age, name = 'unknown', parent_permission = 'Yes')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @validator = Corrector.new
    @rental = []
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  def of_age?
    @age >= 18
  end

  def can_use_service?
    of_age? == true || @parent_permission
  end

  def validate_name
    @name = @validator.correct_name(@name)
  end
end
