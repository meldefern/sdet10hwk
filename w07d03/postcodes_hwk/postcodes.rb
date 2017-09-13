require 'json'
require 'httparty'

module Postcodes

	class SinglePostcode
		include HTTParty

		base_uri 'http://api.postcodes.io/postcodes'

		def initialize(single_postcode_string)
			@get_single_postcode = self.class.get("/#{single_postcode_string}")
		end

		def get_single_postcode_headers
			@get_single_postcode.headers.inspect
		end

		def get_single_postcode_body
			JSON.parse(@get_single_postcode.body)
		end

		def get_single_postcode_response_message
			@get_single_postcode.message
		end

		def get_single_postcode_response_code
			@get_single_postcode.code
		end

	end

	class MultiplePostcodes
		include HTTParty

		base_uri 'http://api.postcodes.io/postcodes'

		def initialize(multiple_postcode_array)
			@get_multiple_postcodes = self.class.post('', body: {
				"postcodes" => multiple_postcode_array
				})
		end

		def get_multiple_postcodes_headers
			@get_multiple_postcodes.headers.inspect
		end

		def get_multiple_postcodes_body
			JSON.parse(@get_multiple_postcodes.body)
		end

		def get_multiple_postcodes_response_message
			@get_multiple_postcodes.message
		end

		def get_multiple_postcodes_response_code
			@get_multiple_postcodes.code
		end

	end

end
# include Postcodes


# pc = Postcodes.generate_random_postcode

# p pc

# p pc.get_single_postcode_body

# postcodes = Postcodes::MultiplePostcodes.new(["ig13rn", "ig12rn"])

# p postcodes.get_multiple_postcodes_response_message

# include Postcodes

# postcode = Postcodes.generate_random_postcode

# p postcode

# include Postcodes

# @postcode = Postcodes.generate_random_postcode.downcase
# @single_postcode = Postcodes::SinglePostcode.new(@postcode)
