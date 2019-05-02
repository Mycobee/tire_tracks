require 'rails_helper'

describe 'as a user on the index page' do
  before(:each) do
    @manufacturer_1 = Manufacturer.create!(name: "Triumph", city: "London, UK", year_founded: 1913)
    @manufacturer_2 = Manufacturer.create!(name: "Chevrolet", city: "Detroit, MI", year_founded: 1911)

    @car_1a = @manufacturer_1.cars.create!(name: "car1a", year: "1921")
    @car_1b = @manufacturer_1.cars.create!(name: "car1b", year: "1922")
    @car_1b = @manufacturer_1.cars.create!(name: "car1c", year: "1922")
    
    @car_2a = @manufacturer_2.cars.create!(name: "car2a", year: "1923")
    @car_2b = @manufacturer_2.cars.create!(name: "car2b", year: "1924")
  end
  
  it 'should display the count of cars for each manufacturer' do
    visit manufacturers_path
    
    within "#manufacturer-#{@manufacturer_1.id}" do
        expect(page).to have_content("Car Count: 3")
    end

    within "#manufacturer-#{@manufacturer_2.id}" do
        expect(page).to have_content("Car Count: 2")
        
    end

      

  end
end