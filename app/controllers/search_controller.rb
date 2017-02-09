class SearchController < ApplicationController
  def index
    @response = EventfulService.search_events_by_zip(params[:q])
  end
end