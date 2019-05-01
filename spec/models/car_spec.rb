RSpec.describe Car, type: :model do
    describe 'validations' do
      it {should validate_presence_of :name}
      it {should validate_presence_of :year}
    end

    describe 'relationships' do
      it {should belong_to :manufacturer}
    end
  end