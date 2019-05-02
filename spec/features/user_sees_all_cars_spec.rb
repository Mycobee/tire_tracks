require 'rails_helper'

describe 'As a user on the manufacturers index' do
  before(:each) do
    @manufacturer_1 = Manufacturer.create!(name: "Triumph", city: "London, UK", year_founded: 1913)
    @manufacturer_2 = Manufacturer.create!(name: "Chevrolet", city: "Detroit, MI", year_founded: 1911)

    @car_1a = @manufacturer_1.cars.create!(name: "car1a", year: "1921")
    @car_1b = @manufacturer_1.cars.create!(name: "car1b", year: "1922")
    
    @car_2a = @manufacturer_2.cars.create!(name: "car2a", year: "1923")
    @car_2b = @manufacturer_2.cars.create!(name: "car2b", year: "1924")
  end
  
  it 'should display all cars belonging to each manufacturer' do
    visit manufacturers_path
    
    within "#car-stat-list-#{@car_1a.id}" do
      expect(page).to have_content(@car_1a.name)
      expect(page).to have_content(@car_1a.year)
    end

    within "#car-stat-list-#{@car_1b.id}" do
      expect(page).to have_content(@car_1b.name)
      expect(page).to have_content(@car_1b.year)
    end

    within "#car-stat-list-#{@car_2a.id}" do 
      expect(page).to have_content(@car_2a.name)
      expect(page).to have_content(@car_2a.year)
    end

    within "#car-stat-list-#{@car_2b.id}" do
      expect(page).to have_content(@car_2b.name)
      expect(page).to have_content(@car_2b.year)
    end
  end
end