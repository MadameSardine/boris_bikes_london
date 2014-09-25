class Station 
	def initialize
		@bikes = []
	end

	def bikes_count
		@bikes.count
	end

	def dock(bike)
		@bikes << bike
	end

	def release(bike)
		@bikes.delete(bike)
	end

	def available_bikes
		@bikes.reject{|bike| bike.broken?}
	end
end