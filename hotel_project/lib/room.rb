class Room
    attr_reader :capacity , :occupants
  def initialize(capacity)
    @capacity = capacity
    @occupants = []
  end 

    def full?
        if @occupants.length < capacity
            return false
        else
            true
        end 
    end

    def available_space 
        capacity - occupants.length
    end 

    def add_occupant(name)
        if self.full?
            return false
        else
            occupants << name
            true
        end
    end 




end