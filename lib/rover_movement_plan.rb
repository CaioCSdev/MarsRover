require_relative 'rover'
require_relative 'plateau'

class Rover_movement_plan

  def self.create_and_place_rover( position , facing, plateau, id)
    if(plateau.can_move_to? position[0], position[1])
      plateau.occupy_position position[0], position[1]
      @rover = Rover.new position, facing, id
    else
    	raise("ERROR: invalid position for rover")
  	end
  end

  def self.execute_rover_plan(rover, plan, plateau)
  	plan.each_char do |step|
			if step == "M"
					position = rover.in_front_of_me
					if plateau.can_move_to?(position.first, position.last)
						plateau.move_occupation(
							rover.get_position_with_facing[0],
							rover.get_position_with_facing[1],
							position.first,
							position.last)
						rover.forward
					else
						raise("ERROR: can not execute rover plan")
					end
      	else
      		rover.spin step
			end
  	end
  	rover.get_position_with_facing
  end

end
