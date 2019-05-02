require 'rails_helper'

describe 'as a visitor on the manufacturer index' do
    before(:each) do
        @manufacturer_1 = Manufacturer.create!(name: "Mercedes", city: "Berlin, Germany", year_founded: 1913, logo_url: "https://images.pexels.com/photos/60504/security-protection-anti-virus-software-60504.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
        @manufacturer_2 = Manufacturer.create!(name: "Ford", city: "Detroit, MI", year_founded: 1911, logo_url: "https://us.123rf.com/450wm/valentint/valentint1703/valentint170303165/74399449-coffee-cup-icon-blue-website-button-on-white-background-.jpg?ver=6")
    end

    it 'should display the manufacturer logo' do
        visit manufacturers_path
        
        within "#manufacturer-#{@manufacturer_1.id}" do
            expect(page).to have_css("img[src*='#{@manufacturer_1.logo_url}']")
        end

        within "#manufacturer-#{@manufacturer_2.id}" do
            expect(page).to have_css("img[src*='#{@manufacturer_2.logo_url}']")
        end
    end
end