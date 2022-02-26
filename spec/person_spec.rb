require_relative '../person'
require_relative '../rental'
require_relative '../book'

describe Person do
  context 'Testing Person class' do
    it 'should print name' do
      person1 = Person.new(20, 'Albus Percival Wulfric Brian Dumbledore', 'Yes')

      person1.validate_name
      name = person1.name

      expect(name).to eq 'Albus Perc'
      expect(person1.can_use_service?).to be true
    end
  end
end
