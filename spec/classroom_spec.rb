require_relative '../classroom'
require_relative '../student'

describe Classroom do
  context 'Testing classroom class' do
    herbology = Classroom.new('Herbology')

    it 'it should return art' do
      expect(herbology.label).to eq 'Herbology'
    end
  end
end