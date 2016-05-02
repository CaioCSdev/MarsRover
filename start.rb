#!/usr/bin/env ruby

require_relative 'lib/rover_movement_plan'

#main
id = i = 1
lines = File.readlines(ARGV[0])
size = lines[0].split
plateau = Plateau.new size[0].to_i, size[1].to_i
while i < lines.length do
  line  = lines[i].split
  rover = Rover_movement_plan.create_and_place_rover( [line[0].to_i, line[1].to_i], line[2], plateau, id)
  plan  = lines[i+1].chomp
  ending_place =Rover_movement_plan.execute_rover_plan(rover, plan, plateau)
  print(ending_place[0], "\s", ending_place[1], "\s", ending_place[2], "\n")
  id += 1
  i  += 2
end
