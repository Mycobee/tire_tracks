require 'rails_helper'

describe 'As a visitor on the manufacturer index page' do
    before(:each) do
        @manufacturer_1 = Manufacturer.create!(name: "Aston Martin", city: "London, UK", year_founded: 1913)
        @manufacturer_2 = Manufacturer.create!(name: "Chevrolet", city: "Detroit, MI", year_founded: 1911)
        @manufacturer_3 = Manufacturer.create!(name: "Porsche", city: "Stuttgart, Germany", year_founded: 1913)
    end
    
    it 'should display all the manufacturers' do
        visit manufacturers_path

        within "#manufacturer-#{@manufacturer_1.id}" do
            expect(page).to have_content(@manufacturer_1.name)
            expect(page).to have_content(@manufacturer_1.year_founded)
            expect(page).to have_content(@manufacturer_1.city)
        end

        within "#manufacturer-#{@manufacturer_2.id}" do
            expect(page).to have_content(@manufacturer_2.name)
            expect(page).to have_content(@manufacturer_2.year_founded)
            expect(page).to have_content(@manufacturer_2.city)
        end

        within "#manufacturer-#{@manufacturer_3.id}" do
            expect(page).to have_content(@manufacturer_3.name)
            expect(page).to have_content(@manufacturer_3.year_founded)
            expect(page).to have_content(@manufacturer_3.city)
        end
    end
end