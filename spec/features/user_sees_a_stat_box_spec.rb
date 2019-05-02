require 'rails_helper'

describe 'as a user on the manufacturers index page' do
    context 'I see a comedian statistics box' do
        before(:each) do
            @manufacturer_1 = Manufacturer.create!(name: "Triumph", city: "London, UK", year_founded: 1913)
            @manufacturer_2 = Manufacturer.create!(name: "Chevrolet", city: "Detroit, MI", year_founded: 1911)
            @manufacturer_3 = Manufacturer.create!(name: "GMC", city: "Detroit, MI", year_founded: 1912)

            @car_1a = @manufacturer_1.cars.create!(name: "car1a", year: "1921")
            @car_1b = @manufacturer_1.cars.create!(name: "car1b", year: "1922")
            
            @car_2a = @manufacturer_2.cars.create!(name: "car2a", year: "1923")
            @car_2b = @manufacturer_2.cars.create!(name: "car2b", year: "1924")
            @car_2c = @manufacturer_2.cars.create!(name: "car2c", year: "1924")

            @manufacturers = Manufacturer.all
        end
        it 'should show the average year founded' do
            visit manufacturers_path
            
            within "#stats-box" do
            expect(page).to have_content("Average Year Founded: #{@manufacturers.avg_year_founded}")
            expect(page).to have_content("Unique Cities: #{@manufacturers.unique_cities}")
            end
        end
    end
end