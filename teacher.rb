require "./person.rb"

class Teacher < Person
  def initialize(name = "unkown", specializatiion)
    super(name, age)
    @specializatiion = specializatiion
  end

  def can_use_service?
    true
  end
end