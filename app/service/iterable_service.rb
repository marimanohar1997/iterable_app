class IterableService
  include RestClientHelper

  def initialize
    @headers = {
      'Api-Key' => Rails.application.credentials[:itr_api_key],
      'Content-Type' => 'application/json'
    }
    @base_url = 'https://api.iterable.com/api'
  end

  def create_event(user_id, event_name)
    url = "#{@base_url}/events/track"
    payload = { userId: user_id, eventName: event_name }
    send_post_request(url, @headers, payload)
  end
  
end