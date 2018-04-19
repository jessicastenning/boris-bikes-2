require_relative './bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
     fail 'no bikes available' if @bikes.empty?
    @bikes.pop
  end

  def dock(bikes)
    fail 'docking station is full' if @bikes.count >= 20
    @bikes << bikes
  end


end
