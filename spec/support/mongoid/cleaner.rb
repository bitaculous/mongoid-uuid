require 'mongoid_cleaner'

RSpec.configure do |config|
  config.before(:suite) do
    MongoidCleaner.strategy = :drop

    MongoidCleaner.clean
  end

  config.around(:each) do |example|
    MongoidCleaner.cleaning do
      example.run
    end
  end
end