require "./person.rb"

class Student < Person
  def initialize(name = "unkown", classroom)
    super(name, age)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end