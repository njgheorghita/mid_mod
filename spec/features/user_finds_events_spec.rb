require 'rails_helper'

describe "As a User" do 
  it "I can search for events" do 
    # As a user, 
    # When I fill in the search with 80202, 
    visit root_path
    fill_in :q, with: "80202"
    # And I click Find Events, 
    click_on "Find Events"
    # The current path is `/search`,
    expect(current_path).to eq("/search")
    # And I can see a list of 16 events with a header `16 events for March', sorted by popularity.
    expect(page).to have_content("16 events for March") 
    # For each event I can see the Event name, date & time, description (shortened to 140 characters), venue name (url to the venue page), venue address.
  end
end