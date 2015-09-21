RSpec.shared_examples 'Mongoid::UUID::Concerns' do
  describe 'fields', type: :feature do
    it { is_expected.to have_field(:uuid).of_type BSON::Binary }
  end

  describe 'validations', type: :feature do
    it { is_expected.to validate_uniqueness_of :uuid }
  end

  describe 'indexes', type: :feature do
    it { is_expected.to have_index_for(uuid: 1).with_options name: 'uuid_index' }
  end
end