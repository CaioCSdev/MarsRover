require 'rover_movement_plan'

describe "rover_movement_plan class" do
  before :all do
    @location = [3, 3, "S"]
    @plan     = "MMRMMRMRRM"
    @plateau  = Plateau.new 5,5
    @plateau.grid[0,0] = true
    @rover = Rover.new 3, 3, "N"
  end

  context "#create_and_place_rover" do
    it "should create a new rover and place it in the plateau" do
      rover = Rover_movement_plan.create_and_place_rover(@location[0], @location[1], @location[3])
      expect(rover.class).to eq Rover
      expect(@plateau.grid[3][3]).to be(true)
    end
    it "should not create a new rover and place it in the plateau" do
      rover = Rover_movement_plan.create_and_place_rover(0, 0, "W")
      expect(rover).to be(nil)
    end
  end
  context "#execute_rover_plan" do
    it "should move the rover accordingly to the plan" do
      ending_place = Rover_movement_plan.execute_rover_plan(@rover, @plan)
      expect(ending_place).to eq([5, 1, "E"])
    end
  end
end
