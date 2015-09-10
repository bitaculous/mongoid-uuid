RSpec.shared_examples 'Mongoid::UUID::ReadOnlyAttribute' do |object|
  describe 'UUID is a read only attribute' do
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