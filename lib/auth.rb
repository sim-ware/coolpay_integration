require "rest_client"


class Auth
  URL = 'https://coolpay.herokuapp.com/api/login'

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

    # TODO: sort this...
    response.nil? ? response = response : response = return_token(response)

    return response
  end


  def add_token_to_header(b)
    headers = {
      :content_type => 'application/json',
      :authorization => 'Bearer ' + b
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
