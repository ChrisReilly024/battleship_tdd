
class Lift
    def initialize(floors,capacity)
        @floors = floors
        @capacity = capacity
    end
end

a = Lift.new([[1,2],[3,4]], 5)
p a