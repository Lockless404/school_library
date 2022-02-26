require_relative '../book'
require_relative '../teacher'
require_relative '../rental'

describe Book do
  context 'When testing Book' do
    it 'the book should print author and name' do
      book = Book.new('Fantastic Beasts', 'Newt Scamander')

      person = Teacher.new('Transfiguration', 60, 'Minerva McGonagall')

      book.add_rental('10-10-10', person)

      expect(book.author).to eq 'Newt Scamander'
      expect(book.rental.first.person.name).to eq 'Minerva McGonagall'
    end
  end
end
