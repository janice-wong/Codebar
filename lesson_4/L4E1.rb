class Celsius
  attr_reader :celsius

  def initialize(temp)
    @temp = temp
  end

  def farenheit
    (@temp * 1.8 + 32).round
  end

  def to_s(scale)
    "#{@temp} degrees #{scale}"
  end
end

days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
temp_by_day = {}

days.each do |day|
  p "#{day}'s temperature: "
  temp = gets.chomp.to_i
  in_celsius = Celsius.new(temp)
  in_farenheit = Celsius.new(in_celsius.farenheit)
  temp_by_day[day] = "#{in_celsius.to_s("C")} | #{in_farenheit.to_s("F")}"
end

temp_by_day.each do |day, temp|
  p "#{day} | #{temp}"
end

