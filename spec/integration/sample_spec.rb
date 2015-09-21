RSpec.describe Sample, type: :model do
  # === Behaviours ===

  describe 'behaviours' do
    it_behaves_like 'Mongoid::UUID'

    it_behaves_like 'Mongoid::UUID::Fabrication' do
      let(:sample)  { Fabricate :sample }
      let(:sample2) { Fabricate :sample2 }
    end

    it_behaves_like 'Mongoid::UUID::ReadOnlyAttribute' do
      let(:sample) { Fabricate :sample }
    end
  end
end