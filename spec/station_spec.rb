require './lib/station.rb'

describe Station do 

	let(:station) {Station.new}
	let(:bike) {double :bike, broken?: false}
	let(:broken_bike) {double :broken_bike, broken?: true}

	context "Upon initialize, a docking station" do

		it 'should have no bikes' do
			expect(station.bikes_count).to eq(0)
		end
	end

	context "During operation time, a docking station" do

		it 'can dock bikes' do
			station.dock(bike)
			expect{station.dock(bike)}.to change{station.bikes_count}.by 1
		end

		it 'can release a bike' do
			station.dock(bike)
			expect{station.release(bike)}.to change{station.bikes_count}.by -1
		end

		it 'should know which bikes are available' do
			allow(broken_bike).to receive(:break!)
			[bike, broken_bike].each {|bike| station.dock(bike)}
			expect(station.available_bikes).to eq([bike])
		end 

	end
end