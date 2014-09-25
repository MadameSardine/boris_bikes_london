require './lib/station.rb'

describe Station do 

	let(:station) {Station.new}
	let(:bike) {double :bike, broken?: false}
	let(:bike2) {double :bike2, broken?: false}
	let(:broken_bike) {double :broken_bike, broken?: true}

	it "should release an available bike to a person" do
		station.dock(bike)
		station.dock(broken_bike)
		expect(station.release_available_bike).to eq(bike)
	end
end