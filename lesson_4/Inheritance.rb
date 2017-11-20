
class Person

  def initialize(name, age)
    @name = name
    @age = age
  end

  def to_s
    "#{@name} is #{@age} years old."
  end
end

class SuperHero < Person
  def initialize(name, age, superpower)
    super(name, age)
    @superpower = superpower
  end

  # def to_s
  #   "#{@name} is #{@age} years old and has the superpower #{@superpower}"
  # end
end

person = Person.new("jane", 4)
p person.to_s

supa = SuperHero.new("bob", 44, "vision")
p supa.to_s
