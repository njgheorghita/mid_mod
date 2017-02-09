class SearchController < ApplicationController
  def index
    response = EventfulService.search_events_by_zip(params[:q])
    events = JSON.parse(response.body)
    @events_array = events["events"]["event"]
  end
end