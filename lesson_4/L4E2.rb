class Tutorial
  attr_reader :type, :difficulty

  def initialize(name, type, difficulty)
    @name = name
    @type = type
    @difficulty = difficulty
  end

  def is_harder_than?(tutorial)
    return "You cannot compare a Ruby with a JavaScript tutorial" if @type != tutorial.type
    difficulty_levels = [:easy, :medium, :hard, :advanced, :expert]
    return true if difficulty_levels.index(@difficulty) > difficulty_levels.index(tutorial.difficulty)
    false
  end
end

tutorial1 = Tutorial.new("Object Oriented Ruby", :ruby, :medium)
tutorial2 = Tutorial.new("Introduction to JavaScript", :javascript, :easy)
tutorial3 = Tutorial.new("HTTP Requests, AJAX and APIs", :javascript, :medium)

p tutorial1.is_harder_than?(tutorial2)
# You cannot compare a Ruby with a JavaScript tutorial

p tutorial2.is_harder_than?(tutorial1)
# You cannot compare a JavaScript with a Ruby tutorial

p tutorial2.is_harder_than?(tutorial3)
# false

p tutorial3.is_harder_than?(tutorial2)
# true
