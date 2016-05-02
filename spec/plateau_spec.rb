require 'plateau'

describe "Plateau object" do
	before :each do
  	@plateau = Plateau.new 5,5
  	@plateau.grid[3][3] = true
	end

  context "new plateau" do
    it "should have all positions false except one" do
      for i in 0..5 do
        for j in 0..5 do
          if(j == 3 and i == 3)
            expect(@plateau.grid[i][j]).to eq(true)
          else
            expect(@plateau.grid[i][j]).to eq(false)
          end
        end
      end
    end
  end

	context "#occupy_position" do
		it "should occupy a space" do
			@plateau.occupy_position(0,0)
			expect(@plateau.grid[0][0]).to eq true
		end
	end

	context "#move_occupation" do
		it "update the occupy position" do
			@plateau.move_occupation(1, 1, 1, 2)
			expect(@plateau.grid[1][1]).to eq false
			expect(@plateau.grid[1][2]).to eq true
		end
	end

	context "#can_move_to?" do
		it "should return true if it is a free space" do
			sucess = @plateau.can_move_to?(0,0)
			expect(sucess).to eq true
		end
		it "should return false if it is an occupied space" do
			sucess = @plateau.can_move_to?(3,3)
			expect(sucess).to eq false
		end
	end
end
