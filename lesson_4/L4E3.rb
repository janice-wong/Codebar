class Member
  attr_reader :full_name
  def initialize(full_name)
    @full_name = full_name
  end
end

class Student < Member
  attr_reader :about
  def initialize(full_name, about)
    super(full_name)
    @about = about
  end
end

class Coach < Member
  attr_reader :bio, :skills
  def initialize(full_name, bio)
    super(full_name)
    @bio = bio
    @skills = ""
  end

  def add_skill(skill)
    if @skills == ""
      @skills = skill
    else
      @skills += ", #{skill}"
    end
  end
end

class Workshop
  attr_reader :date, :venue_name, :members
  def initialize(date, venue_name)
    @date = date
    @venue_name = venue_name
    @members = {
      :students => [],
      :teachers => []
    }
  end

  def add_participant(member)
    if member.is_a?(Student)
      @members[:students] << "#{member.full_name} - #{member.about}"
    elsif member.is_a?(Coach)
      @members[:teachers] << "#{member.full_name} - #{member.skills}\n#{member.bio}"
    end
  end

  def print_details
    puts "Workshop - #{@date} - Venue: #{@venue_name}"
    puts ""
    puts "Students"
    if @members[:students]
      @members[:students].each_with_index do |student, i|
        puts "#{i + 1}. #{student}"
      end
    end
    puts ""
    puts "Teachers"
    if @members[:teachers]
      @members[:teachers].each_with_index do |teacher, i|
        puts "#{i + 1}. #{teacher}"
      end
    end
  end
end

workshop = Workshop.new("12/03/2014", "Shutl")

jane = Student.new("Jane Doe", "I am trying to learn programming and need some help")
lena = Student.new("Lena Smith", "I am really excited about learning to program!")
vicky = Coach.new("Vicky Ruby", "I want to help people learn coding.")
vicky.add_skill("HTML")
vicky.add_skill("JavaScript")
nicole = Coach.new("Nicole McMillan", "I have been programming for 5 years in Ruby and want to spread the love")
nicole.add_skill("Ruby")

workshop.add_participant(jane)
workshop.add_participant(lena)
workshop.add_participant(vicky)
workshop.add_participant(nicole)
workshop.print_details
