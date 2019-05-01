describe 'validations', type: :model do
    it {should validate_presence_of :name}
    it {should validate_presence_of :city}
    it {should validate_presence_of :year_founded}
  end