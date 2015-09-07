RSpec.shared_examples 'Mongoid::UUID' do |described_class|
  describe 'concerns' do
    subject { described_class.new }

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
      object  = described_class.create!
      object2 = described_class.create!
      object3 = described_class.create!

      expect(object.uuid.data).not_to eql object2.uuid.data
      expect(object.uuid.data).not_to eql object3.uuid.data
    end

    it 'generates automatically an UUID' do
      object = described_class.create!
      uuid   = object.uuid.data

      expect(uuid.length).to eq 36
      expect(::UUID.validate(uuid)).to be true
    end

    it 'allows the UUID to be passed as `BSON::Binary`' do
      uuid   = BSON::Binary.new ::UUID.new.generate, :uuid
      object = described_class.create! uuid: uuid

      expect(uuid).to eq object.uuid
    end

    it 'validates the given UUID' do
      object = described_class.new uuid: 'baz-baz1'

      expect(object.valid?).to be false
      expect { object.save! }.to raise_error Mongoid::Errors::Validations

      object = described_class.new uuid: ::UUID.new.generate

      expect(object.valid?).to be false
      expect { object.save! }.to raise_error Mongoid::Errors::Validations
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