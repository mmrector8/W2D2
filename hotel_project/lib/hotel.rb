require_relative "room"

class Hotel
    def initialize(name, room_hash)
        @name = name
        @rooms = {}
        room_hash.each do |room_name,capacity|
            @rooms[room_name] = Room.new(capacity)
        end 
    end 
    def name
        name_arr = @name.split(" ")
        name_arr.map! {|word| word[0].upcase + word[1..-1].downcase}
        name_arr.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        if rooms.has_key?(room_name)
            return true
        else
            false
        end 
    end 

    def check_in(person, room_name)
        if !room_exists?(room_name)
            puts "sorry, room does not exist"
        else
            if @rooms[room_name].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end 
        end 
    end 

    def has_vacancy?
        @rooms.each do |room, capacity|
            if !@rooms[room].full?
                return true
            end
        end 
        false
    end

    def list_rooms
        @rooms.each do |room, capacity|
            puts room  + " " + @rooms[room].available_space.to_s
        end 
    end


end
