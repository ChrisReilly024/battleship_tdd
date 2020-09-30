require "elevator"

describe "elevator" do
    let(:elevator) {Lift.new([[],[],[5,5,5],[],[],[],[]], 5)}

    describe "#initialize" do
        it 'should accept a floor plan and lift capacity' do
            elevator
        end

        it "should set @floors to a two-dimensional array and @capacity, to an integer, with given arguments" do
            expect(elevator.instance_variable_get(:@floors)).to eq([[],[],[5,5,5],[],[],[],[]])
            expect(elevator.instance_variable_get(:@capacity)).to eq(5)
        end
     
        it "should have values for the lift, an array representing all boarded passengers, it's direction, default up, floor log, an array representing all floors passengers have departed or boarded starting at 0, and the lift's current level, default ground floor" do
            expect(elevator.lift).to eq([])
            expect(elevator.direction).to eq('up')
            expect(elevator.log).to eq([0])
            expect(elevator.level).to eq(0)
        end        
    end    

    describe "#full?" do
        it "should return false if the elevator is empty?" do
            expect(elevator.full?).to eq(false)
        end

        it "should return false if the elevator partially filled but below capacity?" do
            elevator.lift = [1,2,3,4]
            expect(elevator.full?).to eq(false)

            elevator.lift = [1,2,3]
            expect(elevator.full?).to eq(false)

            elevator.lift = [1]
            expect(elevator.full?).to eq(false)
        end
        
        it "should return true if the elevator is filled to capacity" do
            elevator.lift = [1, 2, 3, 4, 5]
            expect(elevator.full?).to eq(true)
        end
    end

    describe "#shutdown" do
        it "should return true when all passengers have departed the lift and all floor queues are empty" do
            elevator.lift = []
            elevator.floors = []
            expect(elevator.shutdown).to eq(true)
        end
        
        it "should return false if the lift is empty but there are still people waiting for the elevator" do
                elevator.lift = []
                elevator.floors = [[],[],[5,5,5],[],[],[],[]]
            expect(elevator.shutdown).to eq(false)
        end            
        
        it "should return false if the floor queues are empty but passengers are still on the lift" do
                elevator.lift = [1,2,3]
                elevator.floors = [[],[],[],[],[],[],[]]
            expect(elevator.shutdown).to eq(false)
        end     
    end

    describe "#level_up_down" do
        it "should increase level by 1 if the lift is on the ground floor" do
            elevator.level = 0
            expect(elevator.level_up_down).to eq(1)
        end
        
        it "should increase level by 1 if direction is set to up and the lift is not on the ground floor" do
            elevator.level = 2
            elevator.direction = 'up'
            expect(elevator.level_up_down).to eq(3)
        end
        
        it "should decrease level by 1 if the lift is at the top floor" do
            elevator.level = elevator.floors.count - 1
            expect(elevator.level_up_down).to eq(elevator.floors.count - 2)
        end
        
        it "should decrease level by 1 if the direction is set to down and the lift is not on the top floor" do
            elevator.direction = 'down'
            elevator.level = 4
            expect(elevator.level_up_down).to eq(3)
        end
    end

    describe "#depart_rider" do
        it "should remove all passengers from the lift if the lift is stopped on the matching level" do 
            elevator.level = 1
            elevator.lift = [1]
            expect(elevator.depart_rider).to eq([])

            elevator.lift = [5,5]
            elevator.level = 5
            expect(elevator.depart_rider).to eq([])
            
        end
        
        it "should not remove passengers traveling to a different floor" do 
            elevator.level = 5

            elevator.lift = [5,5,4,2]
            expect(elevator.depart_rider).to eq([4,2])

            elevator.lift = [1,2,3]
            expect(elevator.depart_rider).to eq([1,2,3])
        end
    end

    describe "#queue?" do
        it "should return true if there are passengers waiting to board at a given floor" do
            elevator.floors = [[],[],[1,4],[]]
            elevator.level = 2
            expect(elevator.queue?).to eq(true)
        end
        
        it "should return false if there are no passengers waiting to board at a given floor" do
            elevator.floors = [[],[],[],[]]
            elevator.level = 2
            expect(elevator.queue?).to eq(false)
        end
    end
    
    describe "#add_rider" do        
        it "The lift should not add a passenger if it is at maximum capacity" do
            elevator.level = 3
            elevator.lift = [1,1,1,1,1]
            elevator.floors = [[],[],[],[1,2],[]]
            elevator.direction = 'up'
    
            expect(elevator.add_rider).to eq([1,1,1,1,1])
        end

        it "The lift should not add a passenger if the destination floor is higher than current but direction is down" do
            elevator.level = 3
            elevator.floors = [[],[],[],[4,4],[]]
            elevator.direction = 'down'
        end

        it "The lift should not add a passenger if the destination floor is lower than current but direction is up" do
            elevator.level = 3
            elevator.floors = [[],[],[],[1,2],[]]
            elevator.direction = 'up'
            
            expect(elevator.add_rider).to eq([])
        end
        
        it "The lift should add a passenger if the destination floor is higher than current and direction is up" do
            elevator.level = 2
            elevator.floors = [[],[],[4,4],[4],[]]
            elevator.direction = 'up'
            
            expect(elevator.add_rider).to eq([4,4])
        end        
        
        it "The lift should add a passenger if the destination floor is higher than current and direction is up" do
            elevator.level = 3
            elevator.floors = [[],[],[],[1,2],[]]
            elevator.direction = 'down'
            expect(elevator.add_rider).to eq([1,2])
        end
    end

    describe "#logger" do
        it "should add the current level into the log if a passenger boards the elevator at the current level" do
            elevator.level = 3
            elevator.floors = [[],[],[],[1,2],[]]
            elevator.direction = 'down'
            elevator.add_rider
            expect(elevator.log).to eq([0,3])
        end

        it "should add the current floor into the log if a passenger departs the elevator at the current level" do
            elevator.lift = [3,3]
            elevator.floors = [[],[],[],[]]
            elevator.level = 3
            elevator.depart_rider
            expect(elevator.log).to eq([0,3])
        end

        it "should not add the current floor into the log if another passenger already departed during the same stop and it was already entered in the log. Only one entry per stop/action" do
            elevator.level = 2
            elevator.lift = [2,2,3]
            elevator.floors = [[],[],[],[],[]]
            elevator.direction = 'down'
            elevator.depart_rider
            expect(elevator.log).to eq([0,2])
            expect(elevator.log).to_not eq([0,2,2])
        end

        it "should not add the current floor into the log if another passenger already boarded on the same stop and it was already entered in the log. Only one entry per stop/action" do
            elevator.level = 3
            elevator.floors = [[],[],[],[1,2,1],[]]
            elevator.direction = 'down'
            elevator.add_rider
            expect(elevator.log).to eq([0,3])
            expect(elevator.log).to_not eq([0,3,3])
        end
    end
end