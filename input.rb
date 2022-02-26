def input
  gets.chomp
end

def age_and_name
  print 'Age: '
  age = input.to_i

  print 'Name: '
  name = input
  [age, name]
end

def title_and_author
  print 'Title: '
  title = input

  print 'Author: '
  author = input
  [title, author]
end
