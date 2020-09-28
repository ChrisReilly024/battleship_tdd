require "elevator"

describe "elevator" do
    let(:elevator) {Lift.new([[],[],[5,5,5],[],[],[],[]], 5)}

    describe "#initialize" do
        it 'should accept a floor plan and lift capacity' do
            elevator
            # expect(Lift.new([[],[]], 5)).to_not raise_error
        end

        it "should set @floors and @capacity with arguments" do
            expect(elevator.instance_variable_get(:@floors)).to eq([[],[],[5,5,5],[],[],[],[]])
            expect(elevator.instance_variable_get(:@capacity)).to eq(5)
        end
     
        it "should have instance values for the lift, it's direction, default up, and floor log starting at 0" do
            expect(elevator.lift).to eq([])
            expect(elevator.direction).to eq('up')
            expect(elevator.log).to eq([0])
        end        
    end    

    describe "#full?" do
        it "should return false if the elevator is not filled to capacity" do
            expect(elevator.full?).to eq(false)
        end
        
        it "should return true if the elevator is filled to capacity" do
            elevator.lift << 1 << 2 << 3 << 4 << 5
            expect(elevator.full?).to eq(true)
        end
    end
end