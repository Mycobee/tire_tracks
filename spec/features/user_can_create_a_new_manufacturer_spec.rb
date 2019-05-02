require 'rails_helper'

describe 'As a user visiting /manufacturers/new' do
  before(:each) do
    @manufacturer_1 = Manufacturer.create!(name: "Triumph", city: "London, UK", year_founded: 1913)
    @manufacturer_2 = Manufacturer.create!(name: "Chevrolet", city: "Detroit, MI", year_founded: 1911)

    @car_1a = @manufacturer_1.cars.create!(name: "car1a", year: "1921")
    @car_1b = @manufacturer_1.cars.create!(name: "car1b", year: "1922")
    
    @car_2a = @manufacturer_2.cars.create!(name: "car2a", year: "1923")
    @car_2b = @manufacturer_2.cars.create!(name: "car2b", year: "1924")
  end
  
  it 'should render a new form, and create a new manufacturer' do
    visit new_manufacturer_path
    
    
  end
end