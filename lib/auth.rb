require "rest_client"


class Auth

  def authenticate(username, password)
    username = "\"#{username}\""
    password = "\"#{password}\""

    values = '{
      "username":'+username+',
      "apikey": '+password+'
    }'

    headers = {
      :content_type => 'application/json'
    }

    begin
      response = RestClient.post 'https://coolpay.herokuapp.com/api/login', values, headers
    rescue => e
      e.response
    end
    response.nil? ? response = response : response = return_token(response)
    return response
  end

  def add_double_quotes(string)
    return "\"#{string}\""
  end

  def return_token(response)
    return response.body[10...-2]
  end
end
