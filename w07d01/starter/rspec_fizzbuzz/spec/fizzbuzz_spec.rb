require 'fizzbuzz'

describe Fizzbuzz do

	before(:each) do
		@fizzbuzz = Fizzbuzz.new
		@arr = []
	end

	it 'should return Fizz if given a multiple of 3' do
		expect(@fizzbuzz.compare(3)).to eq 'Fizz'
	end

	it 'should return Buzz if given a multiple of 5' do
		expect(@fizzbuzz.compare(5)).to eq 'Buzz'
	end

	it 'should return fizzBuzz if given a multiple of 3 and 5' do
		expect(@fizzbuzz.compare(15)).to eq 'FizzBuzz'
	end

	it 'should return the number if it\'s not a multiple of 3 or 5' do
		expect(@fizzbuzz.compare(1)).to eq 1
	end

	it 'should return array of given size' do
		expect(@fizzbuzz.fizzBuzz(@arr, 1, 15).length).to eq 16
	end

	it 'should fill position of array with given element' do
		expect(@fizzbuzz.fill(0, 2, @arr)).to eq 2
	end

end

