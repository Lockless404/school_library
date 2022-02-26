require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  context 'Testing Rental class' do
    book1 = Book.new('Harry Potter', 'J K Rowlings')
    person1 = Teacher.new('Beasts', 44, 'Hagrid')
    first_rental = Rental.new('2/2/22', person1, book1)

    it 'should return Harry Potter' do
      expect(first_rental.book.title).to eq 'Harry Potter'
    end

    it 'should return Hagrid' do
      expect(first_rental.person.name).to eq 'Hagrid'
    end
  end
end
