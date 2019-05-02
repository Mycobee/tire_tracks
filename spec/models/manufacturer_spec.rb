require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
    describe 'validations' do
      it {should validate_presence_of :name}
      it {should validate_presence_of :city}
      it {should validate_presence_of :year_founded}
    end

    describe 'relationships' do
      it {should have_many :cars}
    end

    describe 'instance methods' do
      it '#car_count' do
        manufacturer_1 = Manufacturer.create!(name: "Triumph", city: "London, UK", year_founded: 1913)

        car_1a = manufacturer_1.cars.create!(name: "car1a", year: "1921")
        car_1b = manufacturer_1.cars.create!(name: "car1b", year: "1922")

        expect(manufacturer_1.car_count).to eq(2)
      end
    end
  end