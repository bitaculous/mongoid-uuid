RSpec.shared_examples 'Mongoid::UUID' do
  describe 'concerns' do
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
    it 'generates automatically an UUID' do
      object = described_class.new
      uuid   = object.uuid.data

      expect(uuid.length).to eq 36
      expect(::UUID.validate(uuid)).to be true
    end

    it 'allows the UUID to be passed as `BSON::Binary`' do
      uuid   = BSON::Binary.new ::UUID.new.generate, :uuid
      object = described_class.new uuid: uuid

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
end