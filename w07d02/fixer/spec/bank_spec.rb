describe Bank do

	before(:each) do
		@bank = Bank.new

	end

	it 'should return true if the "base" value is a string of length 3' do
		@base = @bank.file["base"]

		expect(@base).to be_a String
		expect(@base.length). to eq 3
	end

	it 'should return a string for the "date" value' do
		expect(@bank.file["date"]).to be_a String
	end

	it 'should return true if the "date" string is in the yyyy-mm-dd format' do
		@date = @bank.file["date"].gsub('-','').to_i

		expect(@date).to be_a Integer
		expect(@date.digits.count).to eq 8
	end

	it 'should return a hash for the "rates" value' do
		expect(@bank.file["rates"]).to be_a Hash
	end

	it 'should return a float for the hash values inside the "rates" hash' do
		@rates = @bank.file["rates"]

		for n in 0...@rates.length do
			expect(@rates.values[n].to_f).to be_a Float
		end
	end

	it 'should return true if the rates key name is uppercase' do
		@rates = @bank.file["rates"]
		keys = @rates.keys

		for n in 0...keys.length do
			expect(keys[n].upcase).to eq keys[n]
		end
	end

end