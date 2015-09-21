RSpec.shared_examples 'Mongoid::UUID::Fabrication' do
  it 'fabricates UUIDs' do
    expect(sample.uuid.data).not_to eql sample2.uuid.data
  end
end