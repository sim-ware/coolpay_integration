# require 'rubygems' if RUBY_VERSION < '1.9'
require 'rest_client'

# DEFAULT
# values = '{
#   "username": "your_username",
#   "apikey": "5up3r$ecretKey!"
# }'

# CUSTOM VALUES
values = '{
  "username": "SamirG",
  "apikey": "ADA8772865C0CA3C"
}'

headers = {
  :content_type => 'application/json'
}

response = RestClient.post 'https://coolpay.herokuapp.com/api/login', values, headers
puts response

# Username: <SamirG>
# API Key: <ADA8772865C0CA3C>
