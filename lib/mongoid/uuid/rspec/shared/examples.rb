require_relative 'examples/concerns'
require_relative 'examples/fabrication'

require_relative 'examples/read_only_attribute'

RSpec.shared_examples 'Mongoid::UUID' do
  it_behaves_like 'Mongoid::UUID::Concerns'
  it_behaves_like 'Mongoid::UUID::Fabrication'
end