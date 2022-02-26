require 'json'
require_relative 'student'
require_relative 'rental'
require_relative 'book'
require_relative 'teacher'
require_relative 'classroom'

module Data
  def save_people
    data = []
    @people.each do |person|
      if person.instance_of?(Teacher)
        data.push({ key: 'teacher', id: person.id, age: person.age, name: person.name,
                    specialization: person.specialization })
      else
        data.push({ key: 'student', id: person.id, age: person.age, name: person.name,
                    permission: person.parent_permission, classroom: person.classroom })
      end
    end
    open('person.json', 'w') { |f| f.write JSON.generate(data) }
  end

  def save_rental
    data = []
    @rentals.each do |rental|
      data.push({ date: rental.date, person: rental.person.id, book: rental.book.title })
    end
    open('rentals.json', 'w') { |f| f << JSON.generate(data) }
  end

  def save_book
    data = []
    @books.each do |book|
      data.push({ title: book.title, author: book.author })
    end
    open('books.json', 'w') { |f| f << JSON.generate(data) }
  end

  def load_people
    if File.exist?('person.json')
      JSON.parse(File.read('person.json')).map do |people|
        if people['key'] == 'teacher'
          teacher = Teacher.new(people['specialization'], people['age'], people['name'])
          teacher
        else
          student = Student.new(people['classroom'], people['age'], people['permission'], people['name'])
          student
        end
      end
    else
      []
    end
  end

  def load_books
    file = 'books.json'
    if File.exist? file
      JSON.parse(File.read(file)).map do |book|
        Book.new(book['title'], book['author'])
      end
    else
      []
    end
  end

  def get_person_by_id(id)
    @people.each { |person| return person if person.id == id }
  end

  def get_book_by_title(title)
    @books.each { |book| return book if book.title == title }
  end

  def load_rentals
    file = 'rentals.json'
    if File.exist? file
      JSON.parse(File.read(file)).map do |rental|
        date = rental['date']
        person = get_person_by_id(rental['person'])
        book = get_book_by_title(rental['book'])
        Rental.new(date, person, book)
      end
    else
      []
    end
  end
end
