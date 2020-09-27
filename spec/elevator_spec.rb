require "elevator"

describe "elevator" do
    let(:lift) {Lift.new([[],[],[5,5,5],[],[],[],[]], 5)}

    describe "#initialize" do
        it 'should accept a floor plan and lift capacity' do
            lift
        end

        it "should have getter methods for floor plan and lift capacities" do
            expect(lift).to respond_to(:floors)
            expect(lift).to respond_to(:capacity)
        end
        
    end    
end