require_relative 'bike_container'

class Station 

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def release_available_bike
		bike = available_bikes.pop
		release(bike)
	end


end