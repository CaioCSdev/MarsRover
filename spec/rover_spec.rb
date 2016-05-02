require 'rover'

describe "Rover object" do
	before :each do
         @rover = Rover.new [1,1] , "N", 1
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
		it "change facing 180 degrees to the right" do
			2.times{@rover.spin("R")}
			expect(@rover.facing).to eq 2
		end
		it "change facing 180 degrees to the left" do
			2.times{@rover.spin("L")}
			expect(@rover.facing).to eq 2
		end
	end

	context "#forward while at 0,0" do
		it "change position +1 in y coordinate when facing north" do
			@rover.forward
			expect(@rover.position).to eq [1,2]
		end
		it "change position +1 in x coordinate when facing east" do
			@rover.facing = 1
			@rover.forward
			expect(@rover.position).to eq [2,1]
		end
		it "change position -1 in y coordinate when facing south" do
			@rover.facing = 2
			@rover.forward
			expect(@rover.position).to eq [1,0]
		end
		it "change position -1 in x coordinate when facing west" do
			@rover.facing = 3
			@rover.forward
			expect(@rover.position).to eq [0,1]
		end
	end

	context "#get_position_with_facing while facing north and at 0,0" do
		it "should get me the right position" do
			position = @rover.get_position_with_facing
			expect(position).to eq [1,1,"N"]
		end
	end

	context "#in_front_of_me while facing north and at 0,0" do
	  it "should return next position if it moves forward" do
	    position = @rover.in_front_of_me
	    expect(position).to eq [1,2]
	    expect(@rover.position).to eq [1,1]
	  end
	end
end
