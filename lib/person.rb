class Person

	def initialize(bike=nil)
		@bike = bike
	end

	def has_bike?
		!@bike.nil?
	end

	def rent_bike_from(station)
		@bike = station.release_available_bike
	end

	def has_accident
		@bike.break!
	end

	def return_bike_to(station)
		station.dock(@bike)
		@bike = nil
	end

end
