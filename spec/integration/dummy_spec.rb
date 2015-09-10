RSpec.describe Dummy, type: :model do
  describe 'behaviours' do
    object = described_class.create!

    it_behaves_like 'Mongoid::UUID'
    it_behaves_like 'Mongoid::UUID::ReadOnlyAttribute', object
  end

  describe 'creation' do
    it 'obviously generates UUIDs' do
      object  = described_class.create!
      object2 = described_class.create!
      object3 = described_class.create!

      expect(object.uuid.data).not_to eql object2.uuid.data
      expect(object.uuid.data).not_to eql object3.uuid.data
    end
  end
end