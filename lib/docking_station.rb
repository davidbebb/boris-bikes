#!/usr/bin/env ruby



class DockingStation

#Properties of docking station
# - has bike
#
  def initialize
    @bike_array=Array.new
    @capacity=20
  end

  def release_bike
    fail 'No bikes here' if @bike_array.length<1
    @bike_array.pop
  end

  def dock_bike(bike)
    fail 'too many bikes here' if @bike_array.length>=@capacity
    @bike_array<<bike
  end

end
