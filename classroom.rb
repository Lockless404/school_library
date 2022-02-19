class Classroom
  attr_accessor :label
  attr_reader :animals

  def initialize(label)
    @name = name
    @students = []
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end