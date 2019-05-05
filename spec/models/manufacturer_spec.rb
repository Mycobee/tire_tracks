require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  before(:each) do
      @manufacturer_1 = Manufacturer.create!(name: "Triumph", city: "London, UK", year_founded: 1913)
      @manufacturer_2 = Manufacturer.create!(name: "Mercedes", city: "Berlin, Germany", year_founded: 1915)
      @manufacturer_3 = Manufacturer.create!(name: "BMW", city: "Berlin, Germany", year_founded: 1914)

      @car_1a = @manufacturer_1.cars.create!(name: "car1a", year: 1924)
      @car_1b = @manufacturer_1.cars.create!(name: "car1b", year: 1922)

      @manufacturers = Manufacturer.all
  end

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
        

        expect(@manufacturer_1.car_count).to eq(2)
      end
    end

    describe "class methods" do
      it '.avg_year_founded' do
        expect(@manufacturers.avg_year_founded).to eq(1914)
      end

      it '.unique_cities' do
        expect(@manufacturers.unique_cities).to eq(["London, UK", "Berlin, Germany"])
      end
    end
  end