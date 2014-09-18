require './lib/bike.rb'

describe Bike do

	let(:bike) {Bike.new}

	it 'should not be broken' do
		expect(bike).not_to be_broken
	end

	it 'can break' do
		bike.break!
		expect(bike).to be_broken
	end	

	it 'can be repaired' do
		bike.break!
		bike.fix!
		expect(bike).not_to be_broken
	end
end