#!/usr/bin/env ruby

class Rover
  attr_accessor :position, :facing, :id

  def initialize position, facing, number_id
    @direction = ["N", "E", "S", "W"]
    @position  = position
    @facing    = @direction.find_index{|face| face == facing}
    @id        = id
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
    x = @position[0]
    y = @position[1]
    case @facing
      when 0 #"N"
        y += 1
      when 1 #"E"
        x += 1
      when 2 #"S"
        y -= 1
      when 3 #"W"
        x -= 1
    end
    [x,y]
  end

  def get_position_with_facing
    [@position[0], @position[1], @direction[ @facing ] ]
  end
end
