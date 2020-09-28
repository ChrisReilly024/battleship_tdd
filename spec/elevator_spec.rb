require "elevator"

describe "elevator" do
    let(:lift) {Lift.new([[],[],[5,5,5],[],[],[],[]], 5)}

    describe "#initialize" do
        it 'should accept a floor plan and lift capacity' do
            lift
            expect(Lift.new([[],[]], 5)).to_not raise_error
        end

        it "should set @floors and @capacity with arguments" do
            expect(lift.instance_variable_get(:@floors)).to eq([[],[],[5,5,5],[],[],[],[]])
            expect(lift.instance_variable_get(:@capacity)).to eq(5)
        end
     
        it "should"

        
    end    
end