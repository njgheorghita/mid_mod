class Event 
  attr_reader :title,
              :description,
              :date_time,
              :city,
              :venue,
              :url,
              :venue_address

  def initialize(attrs = {})
    @title          = attrs[:title]
    description     = attrs[:description] ||= "no description available"
    @description    = description[0..140].html_safe 
    @date_time      = DateTime.parse(attrs[:start_time]).strftime("%A, %d %b %Y %l:%M %p")
    @city           = attrs[:city_name]
    @venue          = attrs[:venue_name]
    @url            = attrs[:venue_url]
    @venue_address  = attrs[:venue_address]
  end

  def self.search_by_zip(zip_code)
    EventfulService.search_events_by_zip(zip_code).map do |event|
      Event.new(event)
    end
  end
end