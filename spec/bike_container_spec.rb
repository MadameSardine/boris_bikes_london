require 'bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer  do

	let(:holder) {ContainerHolder.new}
	let(:bike) {double :bike, broken?: false}
	let(:bike2) {double :bike2, broken?: false}
	let(:broken_bike) {double :broken_bike, broken?: true}

	context "Upon initialize, a bike container" do

		it 'should have no bikes' do
			expect(holder.bikes_count).to eq(0)
		end
	end

	context "During operation time, a bike container" do

		it 'can dock bikes' do
			holder.dock(bike)
			expect{holder.dock(bike)}.to change{holder.bikes_count}.by 1
		end

		it "should know when it's full" do
			expect(holder).not_to be_full
			fill(holder)
			expect(holder).to be_full
		end

		def fill(holder)
			holder.capacity.times{holder.dock(bike)}
		end

		it "should not dock a bike if full" do
			fill(holder)
			expect{holder.dock(bike)}.to raise_error(RuntimeError)
		end

		it 'can release a bike' do
			holder.dock(bike)
			expect{holder.release(bike)}.to change{holder.bikes_count}.by -1
		end

		it "should know when it's empty" do
			expect(holder).to be_empty
		end

		it 'can not release a bike if empty' do
			expect{holder.release(bike)}.to raise_error(RuntimeError)
		end

		it 'should know which bikes are available' do
			[bike, broken_bike].each {|bike| holder.dock(bike)}
			expect(holder.available_bikes).to eq([bike])
		end 

	end
	
end