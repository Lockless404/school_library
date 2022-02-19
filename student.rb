require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(name = 'unkown')
    super(name, age)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
