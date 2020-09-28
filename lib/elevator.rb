
class Lift
    attr_reader :capacity
    attr_accessor :lift, :direction, :log, :floors
    def initialize(floors,capacity)
        @floors = floors
        @capacity = capacity
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

end

# a = Lift.new([[],[],[5,5,5],[],[],[],[]], 5)
# p a
# p a.shutdown

# b = Lift.new([[1],[],[],[],[],[],[]], 5)
# p b
# p b.shutdown


        