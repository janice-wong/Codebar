# class methods include File.open() and Random.rand() - they don't require instances of a class to be generated

class Player
  attr_reader :location
  def initialize(location)
    @location = location
  end

  def look_around
    p @location[:description]
    @location[:items].each do |item|
      p "You see a #{item} on the floor"
    end
  end

  def pick_up(item)
    @location[:items] << item
  end

  def location
    @map.current_location
  end
end

class Location
end

class Map
  def initialize(locations)
    @locations = locations
    @current_location = locations[0]
  end

  def describe
    p @current_location[:description]
    path = @current_location[:edges][0]
    puts "There is a #{path[:item]} going #{path[:direction]} from here."
  end

  def move_to(direction)
    @locations.each do |location|
      location[:edges].each do |edge|
        if edge[:direction] == direction
          location_name = edge[:location]
          @current_location = @locations.find { |location| location[:name] == location_name }
        end
        break
      end
    end
  end
end

locations = [{ name: "living_room",
               description: "You are in the living-room. A wizard is snoring loudly on the couch.",
               items: ["whiskey", "bucket"],
               edges: [{ direction: "upstairs",
                         item: "ladder",
                         location: "attic" }] }, {
               name: "attic",
               description: "You are in the attic. There is a giant welding torch in the corner.",
               edges: [{ direction: "downstairs",
                        item: "ladder",
                        location: "living_room" }] }]

map = Map.new(locations)
map.describe
map.move_to("upstairs")
map.describe
