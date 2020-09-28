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
        
        it "should increase level by 1 if the lift is not on the ground floor and @direction is set to up" do
            elevator.level = 2
            elevator.direction = 'up'
            expect(elevator.level_up_down).to eq(3)
        end
        
        it "should decrease level by 1 if the lift is at the top floor" do
            elevator.level = elevator.floors.count - 1
            expect(elevator.level_up_down).to eq(elevator.floors.count - 2)
        end
        
        it "should decrease level by 1 if the lift is not on the top floor and @direction is set to down" do
            elevator.direction = 'down'
            elevator.level = 4
            expect(elevator.level_up_down).to eq(3)
        end
    end

    # describe "#logger" do
    #     it "should add the current level into the log if a passenger boarded or departed and the current level" do

    #     end

    #     it "should not add the current level into the log if the current level is the most recent entry. no repeats" do

    #     end
    # end


end