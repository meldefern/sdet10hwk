require 'httparty'
require_relative '../postcodes'
require_relative '../generate'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end