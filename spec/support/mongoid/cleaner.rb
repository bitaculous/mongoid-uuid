require 'mongoid/cleaner'

RSpec.configure do |config|
  config.before :suite do
    Mongoid::Cleaner.strategy = :drop

    Mongoid::Cleaner.clean
  end

  config.around :each do |example|
    Mongoid::Cleaner.cleaning do
      example.run
    end
  end
end