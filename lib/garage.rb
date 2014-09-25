require_relative 'bike_container'

class Garage

	include BikeContainer

	def initialize(option = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

end