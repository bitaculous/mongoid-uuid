RSpec.describe Sample, type: :model do
  # === Behaviours ===

  describe 'behaviours' do
    sample  = Fabricate :sample
    sample2 = Fabricate :sample2

    it_behaves_like 'Mongoid::UUID'
    it_behaves_like 'Mongoid::UUID::Fabrication', sample, sample2
    it_behaves_like 'Mongoid::UUID::ReadOnlyAttribute', sample
  end
end