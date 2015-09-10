RSpec.shared_examples 'Mongoid::UUID::Concerns' do
  describe 'fields' do
    it { is_expected.to have_field(:uuid).of_type BSON::Binary }
  end

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of :uuid }
  end

  describe 'indexes' do
    it { is_expected.to have_index_for(uuid: 1).with_options name: 'uuid_index' }
  end
end