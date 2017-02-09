class SearchController < ApplicationController
  def index
    @events = EventfulService.search_events_by_zip(params[:q])
  end
end