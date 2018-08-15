require "rest_client"
require_relative "utils"


class Auth
  URL = 'https://coolpay.herokuapp.com/api/login'
  TOKEN = ''
  DETAILS = []
  UTILS = Utils.new
  @@authorized = false

  def authenticate(username, password)
    values = '{
      "username":'+UTILS.add_double_quotes(username)+',
      "apikey": '+UTILS.add_double_quotes(password)+'
    }'

    headers = {
      :content_type => 'application/json'
    }

    begin
      response = RestClient.post URL, values, headers
    rescue => e
      e.response
    end

    response.nil? ? @@authorized = false : @@authorized = true
    DETAILS[0] = username
    DETAILS[1] = password
    return @@authorized
  end


  def refresh_token()
    values = '{
      "username":'+UTILS.add_double_quotes(DETAILS[0])+',
      "apikey": '+UTILS.add_double_quotes(DETAILS[1])+'
    }'

    headers = {
      :content_type => 'application/json'
    }

    return UTILS.return_token(RestClient.post URL, values, headers)
  end

  def self.authorized
    # Return the value of this variable
    @@authorized
  end

end
