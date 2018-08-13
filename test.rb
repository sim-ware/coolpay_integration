# require 'rubygems' if RUBY_VERSION < '1.9'
require 'rest_client'

# DEFAULT
# values = '{
#   "username": "your_username",
#   "apikey": "5up3r$ecretKey!"
# }'
username = "your_username"
apikey = "5up3r$ecretKey!"
# CUSTOM VALUES
username = "\"#{username}\""
apikey = "\"#{apikey}\""
values = '{
  "username":'+username+',
  "apikey": '+apikey+'
}'

headers = {
  :content_type => 'application/json'
}
puts values
response = RestClient.post 'https://coolpay.herokuapp.com/api/login', values, headers
puts response

# Username: <SamirG>
# API Key: <ADA8772865C0CA3C>
# "{\n  \"username\": \"your_username\",\n  \"apikey\": \"5up3r$ecretKey!\"\n}
