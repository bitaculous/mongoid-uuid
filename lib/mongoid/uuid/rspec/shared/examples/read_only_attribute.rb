RSpec.shared_examples 'Mongoid::UUID::ReadOnlyAttribute' do |object|
  it 'raises an error if the UUID is updated or deleted' do
    expect { object.update_attribute :uuid, 'baz-baz1' }.to raise_error Mongoid::Errors::ReadonlyAttribute

    expect { object.remove_attribute :uuid }.to raise_error Mongoid::Errors::ReadonlyAttribute
  end
end