include Generate
include Postcodes

describe SinglePostcode do

	before(:all) do
		@postcode = Generate::GeneratePostcode.new
		@single_postcode = Postcodes::SinglePostcode.new(@postcode.postcode)
		@body_result = @single_postcode.get_single_postcode_body['result']

		@longitude = @postcode.longitude
		@latitude = @postcode.latitude
	end

	it 'should return true if postcode is a string' do
		expect(@body_result['postcode']).to be_a String
	end

	it 'should return true if quality is an integer between 1 and 9' do
		expect(@body_result['quality']).to be_between(1,9)
	end

	it 'should return true if the countries are viable' do
		countries = ["England", "Scotland", "Wales", "Northen Ireland", "Channel Islands", "Isle of Man"]
		country_contained = false
		for country in countries do
			if @body_result['country'] == country
				country_contained = true
			end
		end
		expect(country_contained).to eq true
	end

	it 'should return true if there is a 200 status code' do
		expect(@single_postcode.get_single_postcode_body['status']).to eq 200
	end

	it 'should be within 6 decimal places of doogal longitude and latitude' do
		expect(@body_result['longitude']).to be_within(0.000001).of(@longitude)
		expect(@body_result['latitude']).to be_within(0.000001).of(@latitude)
	end
end

describe MultiplePostcodes do

	before(:all) do
		@postcode_array = []
		3.times do
			@postcode = Generate::GeneratePostcode.new
			@postcode_array << @postcode.postcode
		end
		@multiple_postcodes = Postcodes::MultiplePostcodes.new(@postcode_array)
		@multi_postcodes_body = @multiple_postcodes.get_multiple_postcodes_body
	end

	it 'should return true if all postcodes are of type string' do
		for query in @multi_postcodes_body['result'] do
			expect(query['result']['postcode']).to be_a String
		end
	end

	it 'should return true if there is a 200 status code' do
		expect(@multiple_postcodes.get_multiple_postcodes_response_code).to eq 200
	end

end