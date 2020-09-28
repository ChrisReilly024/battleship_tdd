
class Lift
    attr_reader :capacity
    attr_accessor :lift, :direction, :log, :floors, :level
    def initialize(floors,capacity)
        @floors = floors
        @capacity = capacity
        @level = 0
        @lift = []
        @direction = 'up'
        @log = [0]
    end

    def full?
        @lift.count >= @capacity
    end

    def shutdown
        if @floors.flatten.empty? && @lift.empty?
            return true
        else
            return false
        end
    end

    def level_up_down
        if @level == 0
            @level += 1 
        elsif @level == @floors.count - 1
            @level -= 1
        else 
            @direction == 'up' ? @level += 1 : @level -= 1
        end
    end
end
