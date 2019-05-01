require 'rails_helper'

describe 'As a visitor on the manufacturer index page' do
  before(:each) do
    @manufacturer_1 = Manufacturer.create!("Aston Martin", "London, UK", 1913)
    @manufacturer_2 = Manufacturer.create!("Chevrolet", "Detroit, MI", 1911)
    @manufacturer_3 = Manufacturer.create!("Porsche", "Stuttgart, Germany", 1913)
  end
    it 'should display all the manufacturers' do
        visit manufacturers_path

        within "#manufacturer-#{@manufacturer_1.id}" do
            expect(page).to have_content(@manufacturer_1.id)
            expect(page).to have_content(@manufacturer_1.year_founded)
            expect(page).to have_content(@manufacturer_1.city)
        end
    end
end