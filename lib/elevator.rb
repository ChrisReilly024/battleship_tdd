
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
        if @lift.include?(@level)
            @lift.delete(@level) 
            logger
        end
        @lift
    end

    def add_rider
        if !full? && queue?
            @floors[@level].each do |passenger|
                if @direction == 'up' && passenger > @level && !full?
                    @lift << passenger
                    logger
                elsif @direction == 'down' && passenger < @level && !full?
                    @lift << passenger
                    logger
                end
            end                
        end
        @lift
    end

    def logger
        @log << @level if @log[-1] != @level
    end
end

# a = Lift.new([[],[],[5,5,5],[],],5)
# p a.add_rider
