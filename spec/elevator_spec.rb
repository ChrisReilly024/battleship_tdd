require "elevator"

describe "elevator" do
    let(:lift) {Lift.new([[],[],[5,5,5],[],[],[],[]], 5)}

    describe "#initialize" do
        it 'should accept a floor plan and lift capacity' do
            lift
        end
    end    
end