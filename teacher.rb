require './person'

class Teacher < Person
  def initialize(specializatiion, name = 'unkown')
    super(name, age)
    @specializatiion = specializatiion
  end

  def can_use_service?
    true
  end
end
