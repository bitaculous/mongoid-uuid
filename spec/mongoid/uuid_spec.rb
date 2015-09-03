RSpec.describe Mongoid::UUID do
  describe 'creation' do
    it 'it generates an UUID' do
      dummy = Dummy.create! name: 'Dummy'
      data  = dummy.uuid.data

      expect(data.length).to eq 36
      expect(::UUID.validate(data)).to be true
    end
  end
end