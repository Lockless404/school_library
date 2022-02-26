require_relative './person'

class Teacher < Person
  attr_reader :specialization
  def initialize(specialization, age, name = 'unkown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
