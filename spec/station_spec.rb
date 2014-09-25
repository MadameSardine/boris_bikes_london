require './lib/station.rb'

describe Station do 

	let(:station) {Station.new}
	let(:bike) {double :bike, broken?: false}
	let(:bike2) {double :bike2, broken?: false}
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

		it "should know when it's full" do
			expect(station).not_to be_full
			fill(station)
			expect(station).to be_full
		end

		def fill(station)
			station.capacity.times{station.dock(bike)}
		end

		it "should not dock a bike if full" do
			fill(station)
			expect{station.dock(bike)}.to raise_error(RuntimeError)
		end

		it 'can release a bike' do
			station.dock(bike)
			expect{station.release(bike)}.to change{station.bikes_count}.by -1
		end

		it "should know when it's empty" do
			expect(station).to be_empty
		end

		it 'can not release a bike if empty' do
			expect{station.release(bike)}.to raise_error(RuntimeError)
		end

		it 'should know which bikes are available' do
			[bike, broken_bike].each {|bike| station.dock(bike)}
			expect(station.available_bikes).to eq([bike])
		end 

	end
end