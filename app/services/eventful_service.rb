class EventfulService
  def self.search_events_by_zip(zip_code)
    conn = Faraday.new("http://api.eventful.com/json/events/search")
    
    response = conn.get do |req| 
      req.params['app_key'] = ENV["EVENTFUL_APP_KEY"]
      req.params['location'] = zip_code
      req.params['date'] = "March"
      req.params['sort_order'] = "popularity"
      req.params['page_size'] = 16
    end

    JSON.parse(response.body, symbolize_names: true)[:events][:event]
  end
end