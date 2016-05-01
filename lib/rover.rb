#!/usr/bin/env ruby

class Rover
  attr_accessor :position, :facing, :number_id

  def initialize position, facing, number_id
    @direction = ["N", "E", "S", "W"]
    @position  = position
    @facing    = @direction.find_index{|face| face == facing}
    @number_id = number_id
  end

  def spin(direction)
    if(direction == "R")
      @facing = (@facing + 1)% 4
    else
      @facing = (@facing - 1)% 4
    end
  end

  def forward
    @position = in_front_of_me
  end

  def in_front_of_me
    location = @position
    case @facing
      when 0 #"N"
        location[1] += 1
      when 1 #"E"
        location[0] += 1
      when 2 #"S"
        location[1] -= 1
      when 3 #"W"
        location[0] -= 1
    end
    location
  end

  def get_position_with_facing
    [@position[0], @position[1], @direction[ @facing ] ]
  end
end
