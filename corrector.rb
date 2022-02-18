class Corrector
  def correct_name(name)
    names = name.chars
    names[0] = names[0].upcase
    names[0..9].join
  end
end
