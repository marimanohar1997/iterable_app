require 'rest-client'

module RestClientHelper
  # get request
  def send_get_request(url, headers = {}, payload = {})
    response = RestClient.get(url, payload:, headers:)
    { status: true, response: JSON.parse(response.body) }
  rescue RestClient::ExceptionWithResponse => e
    { status: false, response: e.response }
  end

  # post request
  def send_post_request(url, headers = {}, payload = {})
    response = RestClient.post(url, payload:, headers:)
    { status: true, response: JSON.parse(response.body) }
  rescue RestClient::ExceptionWithResponse => e
    { status: false, response: e.response }
  end

  # put request
  def send_put_request(url, headers = {}, payload = {})
    response = RestClient.put(url, payload:, headers:)
    { status: true, response: JSON.parse(response.body) }
  rescue RestClient::ExceptionWithResponse => e
    { status: false, response: e.response }
  end

  # delete request
  def send_delete_request(url, headers = {}, payload = {})
    response = RestClient.delete(url, payload:, headers:)
    { status: true, response: JSON.parse(response.body) }
  rescue RestClient::ExceptionWithResponse => e
    { status: false, response: e.response }
  end
end
