require './lib/person.rb'

describe Person do
	
	let(:person){Person.new}
	let(:person_with_bike) {Person.new(bike)}
	let(:station) {double :station}
	let(:bike) {double :bike}

	context "Upon initialize, a person" do

		it 'doesnt have a bike' do
			expect(person).not_to have_bike
		end	

		it 'can have a bike' do
			person = Person.new(:bike)
			expect(person).to have_bike
		end

	end

	context "During operation, a person" do

		it 'can rent a bike from a station' do
			allow(station).to receive(:release_available_bike).and_return(:bike)
			person.rent_bike_from(station)
			expect(person).to have_bike
		end

		it 'can have an accident and break a bike' do
			expect(bike).to receive(:break!)
			person_with_bike.has_accident
		end

		it 'can return a bike to a station' do
			expect(station).to receive(:dock)
			person_with_bike.return_bike_to(station)
			expect(person).not_to have_bike
		end
	end

end