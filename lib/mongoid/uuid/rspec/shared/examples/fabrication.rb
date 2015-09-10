RSpec.shared_examples 'Mongoid::UUID::Fabrication' do
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