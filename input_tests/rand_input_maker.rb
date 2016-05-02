#!/usr/bin/ruby
sizeX = ARGV[0].to_i
sizeY = ARGV[1].to_i
number_of_rovers = ARGV[2].to_i

rovers = Array.new(number_of_rovers)
plans = Array.new(number_of_rovers){""}
positions = []
compass_points = ["N", "E", "S", "W"]
actions = ["L", "R", "M"]

raise("ERROR not enough space in the plateau") if(number_of_rovers > sizeX * sizeY)

#get all rovers initial positions 
try_position = [rand(0..sizeX), rand(0..sizeY)]
number_of_rovers.times do
  while(positions.include? try_position) do
    try_position = [rand(0..sizeX), rand(0..sizeY)]
  end
  positions.push try_position
end

#set all rovers orientation
positions.each_index do |index|
  rovers[index] = 
    positions[index][0].to_s + " " +
    positions[index][1].to_s + " " +
    compass_points[rand(0..3)]
end

puts ARGV[0] + " " + ARGV[1]
rovers.each_index do |index|
  (sizeX + sizeY).times do
    plans[index].concat actions[rand(0..2)]
  end
  puts rovers[index]
  puts plans[index]
end


