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
    # return values
    begin
      response = RestClient.post 'https://coolpay.herokuapp.com/api/login', values, headers
    rescue => e
      e.response
    end
    return response
  end

end


# b = a.authenticate('your_username', '5up3r$ecretKey!')
# b = a.authenticate('SamirG', 'ADA8772865C0CA3C')
# b = a.authenticate('Nope', 'Wrong')

# expectedValue = "\"#{expectedValue}\""
# username = "\"#{username}\""
# password = "\"#{password}\""

# Username: <SamirG>
# API Key: <ADA8772865C0CA3C>

# begin
#   RestClient.get 'http://example.com/resource'
# rescue => e
#   e.response
# end
