#!/usr/bin/env ruby



class DockingStation

#Properties of docking station
# - has bike
#
  def initialize
    @bike_array=Array.new
    @capacity=20
  end

  def release_bike(bike)
    fail 'No bikes here' if @bike_array.empty?
    fail 'bike is broken' if bike.working? == false
    #@bike_array.select{|x| x=bike}
    @bike_array.delete(bike)
    #return bike


  end

  def dock_bike(bike)
    fail 'too many bikes here' if @bike_array.length>=@capacity
    @bike_array<<bike
    #set bike to working/not working
  end

  def change_capacity(num)
  #add method to change capacity - should add error handling num>0
    @capacity=num
  end

   def list_broken_bikes
     @broken_bikes =[]
     @broken_bikes<<@bike_array.delete_if{|bike| bike.working?}
   end


end
