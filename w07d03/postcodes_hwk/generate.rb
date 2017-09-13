require 'httparty'

module Generate

	class GeneratePostcode
		include HTTParty

		attr_accessor :postcode, :longitude, :latitude

		def initialize
			postcode = HTTParty.get('https://www.doogal.co.uk/CreateRandomPostcode.ashx')

			doogal_array = postcode.body.split(',')

			@postcode = doogal_array[0].delete(' ').downcase

			@latitude = doogal_array[1].to_f

			@longitude = doogal_array[2].to_f

		end
	end

end