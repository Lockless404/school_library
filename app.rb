require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'classroom'
require_relative 'input'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
    @classroom = Classroom.new('Microverse')
  end

  def run
    puts 'Welcome to School Library!'
    loop do
      menu
      option = input
      break if option == '7'

      get_num option
    end
    puts 'Thank you for using our Library!'
  end

  def menu
    puts
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def get_num(option)
    case option
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals_by_person_id
    else
      puts 'Please enter a number between 1 and 7'
    end
  end

  def list_all_books
    puts 'No books are created yet! Please use option 5 to create a books.' if @books.empty?

    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    sleep 0.75
  end

  def list_all_people
    puts 'No people are created yet! Please use option 4 to create a person.' if @people.empty?
    @people.map { |person| puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    sleep 0.75
  end

  def create_person
    print 'Do you want to create a student (1) or teacher (2) [Input respective number]: '
    option = input

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid input. Please input 1 or 2'
    end
  end

  def create_student
    age, name = age_and_name

    print 'Has parent permission? [Y/N]: '
    parent_permission = input.downcase

    student = Student.new(@classroom, age, name, parent_permission)
    @people << student

    puts 'Student successfully created!'
    sleep 0.75
  end

  def create_teacher
    age, name = age_and_name

    print 'Specialization: '
    specialization = input

    teacher = Teacher.new(specialization, name, age)
    @people << teacher

    puts 'Teacher successfully created!'
    sleep 0.75
  end

  def create_book
    title, author = title_and_author

    book = Book.new(title, author)
    @books << book

    puts 'Book successfully created!'
    sleep 0.75
  end
end

def create_rental
  puts 'Select a book from the following list by number'
  @books.each_with_index { |book, index| puts "#{index + 1}) Title: #{book.title}, Author: #{book.author}" }

  book_id = input.to_i

  puts 'Select a person from the following list by number (not id)'
  @people.each_with_index do |person, index|
    puts "#{index + 1}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end

  person_id = input.to_i

  print 'Date: '
  date = input.to_s

  rental = Rental.new(date, @people[person_id - 1], @books[book_id - 1])
  @rentals << rental

  puts 'Rental successfully created!'
  sleep 0.75
end

def list_rentals_by_person_id
  print 'ID of person: '
  id = input.to_i

  puts 'Rentals:'
  @rentals.each do |rental|
    puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
  end
  sleep 0.75
end
