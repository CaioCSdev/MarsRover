require 'rover'


describe "Rover object" do
	before :each do
  	@rover = Rover.new [0,0] , "N", 1
	end

	context "#spin while facing north" do
		it "change facing 90 degrees to the right" do
			@rover.spin("R")
			expect(@rover.facing).to eq 1
		end
		it "change facing 90 degrees to the left" do
			@rover.spin("L")
			expect(@rover.facing).to eq 3
		end
	end

	context "#forward while facing north and at 0,0" do
		it "change position +1 in y coordinate" do
			@rover.forward
			expect(@rover.position).to eq [0,1]
		end
	end

	context "while facing north and at 0,0" do
		it "should get me the right position" do
			position = @rover.get_position_with_facing
			expect(position).to eq [0,0,"N"]
		end
	end
end
