class Station 

	def initialize
		@bikes = []
	end

	def capacity
		20
	end

	def bikes_count
		@bikes.count
	end

	def dock(bike)
		raise "The station is full" if full?
		@bikes << bike
	end

	def release(bike)
		raise "The station is empty!" if bikes_count == 0
		@bikes.delete(bike)
	end

	def available_bikes
		@bikes.reject{|bike| bike.broken?}
	end

	def full?
		bikes_count == capacity
	end

	def empty?
		bikes_count == 0
	end
end