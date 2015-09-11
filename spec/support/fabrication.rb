require 'fabrication'

Fabrication.configure do |config|
  config.fabricator_path = 'spec/fabricators'
  config.sequence_start  = 0
end