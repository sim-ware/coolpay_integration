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
    return response
  end

end
