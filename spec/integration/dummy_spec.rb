RSpec.describe Dummy, type: :model do
  it_behaves_like 'Mongoid::UUID'

  describe 'creation' do
    it 'obviously generates UUIDs' do
      object  = described_class.create!
      object2 = described_class.create!
      object3 = described_class.create!

      expect(object.uuid.data).not_to eql object2.uuid.data
      expect(object.uuid.data).not_to eql object3.uuid.data
    end
  end

  describe 'UUID is a read only attribute' do
    let(:object) { described_class.create! }

    context 'update' do
      it 'raises an error' do
        expect { object.update_attribute :uuid, 'baz-baz1' }.to raise_error Mongoid::Errors::ReadonlyAttribute
      end
    end

    context 'remove' do
      it 'raises an error' do
        expect { object.remove_attribute :uuid }.to raise_error Mongoid::Errors::ReadonlyAttribute
      end
    end
  end
end