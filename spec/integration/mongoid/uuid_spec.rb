RSpec.describe Mongoid::UUID, type: :model do
  it_behaves_like 'Mongoid::UUID', Dummy
end