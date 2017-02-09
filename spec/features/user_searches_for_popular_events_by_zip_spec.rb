require 'rails_helper'

describe "As a User" do 
  it "I can search for events" do 
    VCR.use_cassette("event_search") do 

      visit root_path
      fill_in :q, with: "80202"

      click_on "Find Events"

      expect(current_path).to eq("/search")
      expect(page).to have_content("16 Events for March") 
      page.should have_selector('table tr', :count => 17)
      within first('.event') do 
        expect(page).to have_content("Experience Hendrix")
        expect(page).to have_content("Denver")
        expect(page).to have_content("Tuesday, 07 Mar 2017 7:30 PM")
        expect(page).to have_content("no description available")
        expect(page).to have_content("Paramount Theatre")
        expect(page).to have_content("1621 Glenarm Place")
      end
    end
  end
end 