require_relative './bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
     fail 'no bikes available' if empty? #@bikes.empty?
    @bikes.pop
  end

  def dock(bikes)
    fail 'docking station is full' if full? #@bikes.count >= 20
    @bikes << bikes
  end

  private

  def full?
    bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end
