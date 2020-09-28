
class Lift
    attr_reader :floors, :capacity
    attr_accessor :lift, :direction, :log
    def initialize(floors,capacity)
        @floors = floors
        @capacity = capacity
        @lift = []
        @direction = 'up'
        @log = [0]
    end

    
end

