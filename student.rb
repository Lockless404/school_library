require_relative './person'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(classroom, age, parent_permission, name = 'unkown')
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end

  def play_hooky
    'Playing......'
  end
end
