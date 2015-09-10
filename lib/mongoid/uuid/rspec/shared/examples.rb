require_relative 'examples/concerns'
require_relative 'examples/fabrication'

RSpec.shared_examples 'Mongoid::UUID' do
  it_behaves_like 'Mongoid::UUID::Concerns'

  it_behaves_like 'Mongoid::UUID::Fabrication'
end