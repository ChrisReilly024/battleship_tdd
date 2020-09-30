
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

    def queue?
        @floors[@level].count > 0
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

    def depart_rider
        @lift.delete(@level) if @lift.include?(@level)
        @lift
    end

    def add_rider
        if !full? && queue?
            @floors[@level].each do |passenger|
                if @direction == 'up' && passenger > @level && !full?
                    @lift << passenger
                elsif @direction == 'down' && passenger < @level && !full?
                    @lift << passenger
                end
            end                
        end
        @lift
    end

end

# a = Lift.new([[],[],[5,5,5],[],],5)
# p a.add_rider
