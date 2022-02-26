require_relative '../corrector'

describe Corrector do
  context 'Testing corrector slass' do
    it 'should correct input' do
      name = Corrector.new
      expect(name.correct_name('albus Percival Wulfric Brian Dumbledore')).to eql 'Albus Perc'
    end
  end
end
