require "rest_client"


class Auth
  URL = 'https://coolpay.herokuapp.com/api/login'
  TOKEN = ''
  DETAILS = []
  @@authorized = false

  def authenticate(username, password)
    values = '{
      "username":'+add_double_quotes(username)+',
      "apikey": '+add_double_quotes(password)+'
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
      "username":'+add_double_quotes(DETAILS[0])+',
      "apikey": '+add_double_quotes(DETAILS[1])+'
    }'

    headers = {
      :content_type => 'application/json'
    }

    return return_token(RestClient.post URL, values, headers)
  end

  def self.authorized
    # Return the value of this variable
    @@authorized
  end

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  def add_token_to_header(token)
    headers = {
      :content_type => 'application/json',
      :authorization => 'Bearer ' + token
    }
    return headers
  end


  def add_double_quotes(string)
    return "\"#{string}\""
  end


  def return_token(response)
    return response.body[10...-2]
  end

end
