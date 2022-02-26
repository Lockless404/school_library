require_relative '../teacher'

describe Teacher do
  context 'Testing teacher class' do
    it 'Teacher class should print age and name' do
      teacher = Teacher.new('Defence Agianst the Dark Arts', 45, 'Severus')

      expect(teacher.age).to be 45
      expect(teacher.specialization).to eql 'Defence Agianst the Dark Arts'
    end
  end
end
