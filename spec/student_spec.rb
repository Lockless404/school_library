require_relative '../student'
require_relative '../classroom'

describe Student do
  context 'Testing student class' do
    it 'should print the student name and method' do
      student1 = Student.new(@classroom, 12, 'no', 'Harry')

      expect(student1.name).to eq 'Harry'

      expect(student1.play_hooky).to eql 'Playing......'
    end
  end
end
