require 'fabrication'

Fabrication.configure do |config|
  config.fabricator_path = 'spec/resources/fabricators'
  config.sequence_start  = 0
end