module BikeContainer

	DEFAULT_CAPACITY = 20

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bikes_count
		bikes.count
	end

	def dock(bike)
		raise "The bike container is full" if full?
		bikes << bike
	end

	def release(bike)
		raise "The bike container is empty!" if bikes_count == 0
		bikes.delete(bike)
	end

	def available_bikes
		bikes.reject{|bike| bike.broken?}
	end

	def full?
		bikes_count == capacity
	end

	def empty?
		bikes_count == 0
	end

end