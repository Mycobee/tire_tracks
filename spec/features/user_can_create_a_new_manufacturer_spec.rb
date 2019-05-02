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
    
    expect(current_path).to eq(new_manufacturer_path)

    fill_in "manufacturer[name]", with: "Fake Car man"
    fill_in "manufacturer[city]", with: "Dublin, Ireland"
    fill_in "manufacturer[year_founded]", with: 1964
    fill_in "manufacturer[logo_url]", with: "https://getuikit.com/v2/docs/images/placeholder_600x400.svg"
    click_button "Create Manufacturer"

    expect(current_path).to eq(manufacturers_path)
    manufacturer = Manufacturer.last
    
    within "#manufacturer-#{manufacturer.id}"
        expect(page).to have_content("Manufacturer Name: Fake Car man")
    end
end