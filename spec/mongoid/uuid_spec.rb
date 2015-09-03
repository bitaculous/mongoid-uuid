RSpec.describe Mongoid::UUID do
  describe 'creation' do
    it 'generates an UUID' do
      dummy = Dummy.create! name: 'Dummy'
      uuid  = dummy.uuid.data

      expect(uuid.length).to eq 36
      expect(::UUID.validate(uuid)).to be true
    end

    it 'allows the UUID to be passed into' do
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
end