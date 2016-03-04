require 'fabrication'

Fabrication.configure do |config|
  config.fabricator_path = 'spec/shared/fabricators'
  config.sequence_start  = 0
end