require 'rails_helper'

describe "As a User" do 
  it "I can search for events" do 
    VCR.use_cassette("event_search") do 

      visit root_path
      fill_in :q, with: "80202"

      click_on "Find Events"

      expect(current_path).to eq("/search")
      expect(page).to have_content("16 events for March") 
      page.should have_selector('table tr', :count => 17)
      # For each event I can see the Event name, date & time, description (shortened to 140 characters), venue name (url to the venue page), venue address.
    end
  end
end