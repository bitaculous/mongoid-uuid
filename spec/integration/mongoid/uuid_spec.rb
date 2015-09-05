RSpec.describe Mongoid::UUID, type: :model do
  describe 'concerns' do
    subject { Dummy.new }

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

  describe 'creation' do
    it 'obviously generates UUIDs' do
      dummy  = Dummy.create! name: 'Dummy'
      dummy2 = Dummy.create! name: 'Dummy2'
      dummy3 = Dummy.create! name: 'Dummy3'

      expect(dummy.uuid.data).not_to eql dummy2.uuid.data
      expect(dummy.uuid.data).not_to eql dummy3.uuid.data
    end

    it 'generates automatically an UUID' do
      dummy = Dummy.create! name: 'Dummy'
      uuid  = dummy.uuid.data

      expect(uuid.length).to eq 36
      expect(::UUID.validate(uuid)).to be true
    end

    it 'allows the UUID to be passed as `BSON::Binary`' do
      uuid  = BSON::Binary.new ::UUID.new.generate, :uuid
      dummy = Dummy.create! name: 'Dummy', uuid: uuid

      expect(dummy.uuid).to eq uuid
    end

    it 'validates the given UUID' do
      dummy = Dummy.new name: 'Dummy', uuid: 'baz-baz1'

      expect(dummy.valid?).to be false
      expect { dummy.save! }.to raise_error Mongoid::Errors::Validations

      dummy = Dummy.new name: 'Dummy', uuid: ::UUID.new.generate

      expect(dummy.valid?).to be false
      expect { dummy.save! }.to raise_error Mongoid::Errors::Validations
    end
  end

  describe 'UUID is a read only attribute' do
    let(:dummy) { Dummy.create! name: 'Dummy' }

    context 'update' do
      it 'raises an error' do
        expect { dummy.update_attribute :uuid, 'baz-baz1' }.to raise_error Mongoid::Errors::ReadonlyAttribute
      end
    end

    context 'remove' do
      it 'raises an error' do
        expect { dummy.remove_attribute :uuid }.to raise_error Mongoid::Errors::ReadonlyAttribute
      end
    end
  end
end