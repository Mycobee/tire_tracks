require 'rails_helper'

describe 'as a user' do
    context 'when I visit the /manufacturers?year_founded=1911' do
        before(:each) do
            @manufacturer_1 = Manufacturer.create!(name: "Mercedes", city: "Berlin, Germany", year_founded: 1913, logo_url: "https://images.pexels.com/photos/60504/security-protection-anti-virus-software-60504.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
            @manufacturer_2 = Manufacturer.create!(name: "Ford", city: "Detroit, MI", year_founded: 1911, logo_url: "https://us.123rf.com/450wm/valentint/valentint1703/valentint170303165/74399449-coffee-cup-icon-blue-website-button-on-white-background-.jpg?ver=6")
            @manufacturer_3 = Manufacturer.create!(name: "Chevy", city: "Detroit, MI", year_founded: 1911, logo_url: "https://us.123rf.com/450wm/valentint/valentint1703/valentint170303165/74399449-coffee-cup-icon-blue-website-button-on-white-background-.jpg?ver=6")
        end
        
        it 'should return a page with all cars matching that age request' do
            visit '/manufacturers?year_founded=1911'
        
            expect(page).to_not have_content("Manufacturer Name: #{@manufacturer_1.name}")
            expect(page).to have_content("Manufacturer Name: #{@manufacturer_2.name}")
            expect(page).to have_content("Manufacturer Name: #{@manufacturer_3.name}")
        end
    end
end