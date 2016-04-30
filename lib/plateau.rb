#!/usr/bin/env ruby

class Plateau
  attr_accessor :grid
  def initialize(sizeX, sizeY)
    @grid = Array.new sizeX, Array.new(sizeY, false) 
  end

  def occupy_position(x, y)
      @grid[x][y] = true
  end

  def move_occupation(oldX, oldY, newX, newY)
    @grid[oldX][oldY] = false
    @grid[newX][newY] = true
  end

  def can_move_to?(x,y)
    not @grid[x][y]
  end
end
