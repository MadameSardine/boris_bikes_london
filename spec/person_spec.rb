require './lib/person.rb'

describe Person do
	
	let(:person){Person.new}
	it 'doesnt have a bike' do
		expect(person).not_to have_bike
	end	

	it 'can have a bike' do
		person = Person.new(:bike)
		expect(person).to have_bike
	end

	it 'can rent a bike from a station' do
		station = double :station
		allow(station).to receive(:release_available_bike).and_return(:bike)
		person.rent_bike_from(station)
		expect(person).to have_bike
	end

	it 'can have an accident and break a bike' do
		station = double :station
		bike = double :bike
		person  = Person.new(bike)
		expect(bike).to receive(:break!)
		person.has_accident
	end

	it 'can return a bike to a station' do
		station = double :station
		bike = double :bike
		person  = Person.new(bike)
		expect(station).to receive(:dock)
		person.return_bike_to(station)
		expect(person).not_to have_bike
	end

end