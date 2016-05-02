require 'rover_movement_plan'

describe "rover_movement_plan class" do
  before :all do
    @location = [3, 3], "S"
    @plan1    = "LMLMLMLMM"
    @plan2    = "MMRMMRMRRM"
    @plan3    = "MMMMMMMMMM"
    @plateau  = Plateau.new 5,5
    @plateau.grid[0][0] = true
    @rover1 = Rover.new [1, 2], "N", 1
    @rover2 = Rover.new [3, 3], "E", 2
  end

  context "#create_and_place_rover" do
    it "should create a new rover and place it in the plateau" do
      rover = Rover_movement_plan.create_and_place_rover(@location[0], @location[1], @plateau, 1)
      expect(rover.class).to eq Rover
      expect(@plateau.grid[3][3]).to be(true)
    end
    it "should not create a new rover and place it in the plateau" do
      expect{Rover_movement_plan.create_and_place_rover([0, 0], "W", @plateau, 1)}.to raise_error(RuntimeError, "ERROR: invalid position for rover")
    end
  end
  context "#execute_rover_plan" do
    it "should move the rover accordingly to the plan 1" do
      ending_place = Rover_movement_plan.execute_rover_plan(@rover1, @plan1, @plateau)
      expect(ending_place).to eq([1, 3, "N"])
    end
    it "should move the rover accordingly to the plan 2" do
      ending_place = Rover_movement_plan.execute_rover_plan(@rover2, @plan2, @plateau)
      expect(ending_place).to eq([5, 1, "E"])
    end
    it "should get an error for plan 3" do
      expect{Rover_movement_plan.execute_rover_plan(@rover2, @plan3, @plateau)}.to raise_error(RuntimeError, "ERROR: can not execute rover plan")
    end
  end
end
