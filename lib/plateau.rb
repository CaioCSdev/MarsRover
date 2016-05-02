#!/usr/bin/env ruby

class Plateau
  attr_accessor :grid
  def initialize(sizeX, sizeY)
    @grid = Array.new(sizeX+1) {Array.new(sizeY+1){false}}
    @sizeX=sizeX
    @sizeY=sizeY
  end

  def occupy_position(x, y)
      @grid[x][y] = true
  end

  def move_occupation(oldX, oldY, newX, newY)
    @grid[oldX][oldY] = false
    @grid[newX][newY] = true
  end

  def can_move_to?(x,y)
    if x.between?(0,@sizeX)
      if y.between?(0, @sizeY)
        if !@grid[x][y]
          return true
        end
      end
    end
    false
  end
end
