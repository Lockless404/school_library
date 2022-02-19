require_relative './corrector'

class Person
  attr_reader :id,
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @validator = Corrector.new
    @rentals = []
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
