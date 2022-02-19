class Book
  attr_reader :rentals
  attr_accessor :name, :address

  def initialize(title, author)
    @name = name
    @address = address
    @rentals = []
  end
end