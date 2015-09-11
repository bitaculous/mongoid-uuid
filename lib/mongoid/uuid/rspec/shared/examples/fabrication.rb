RSpec.shared_examples 'Mongoid::UUID::Fabrication' do |object1, object2|
  it 'fabricates UUIDs' do
    expect(object1.uuid.data).not_to eql object2.uuid.data
  end
end