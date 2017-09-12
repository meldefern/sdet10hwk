require 'json'
		
class Bank

	attr_accessor :file

	def initialize
		@file = JSON.parse(File.read('bank.json'))
	end

end