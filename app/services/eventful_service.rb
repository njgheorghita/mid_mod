class EventfulService
  def self.search_events_by_zip(zip_code)
    response = Faraday.get("http://api.eventful.com/json/events/search?app_key=#{ENV["EVENTFUL_APP_KEY"]}&location=#{zip_code}&date=March&sort_order=popularity&page_size=16")
    JSON.parse(response.body, symbolize_names: true)[:events][:event]
  end
end