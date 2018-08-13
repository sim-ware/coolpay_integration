require 'rest_client'
require './lib/auth'
# Username: <SamirG>
# API Key: <ADA8772865C0CA3C>
# irb -r ./lib/auth.rb

# # # # # # #
a = Auth.new
b = a.authenticate('SamirG', 'ADA8772865C0CA3C')
c = b.body
c = c[10...-2]
# # # # # # # #

headers = {
  :content_type => 'application/json',
  :authorization => 'Bearer ' + c
}

response = RestClient.get 'https://coolpay.herokuapp.com/api/payments', headers
puts response

# # # # # # # #
# a = Auth.new
# b = a.authenticate('SamirG', 'ADA8772865C0CA3C')
# c = b.body
# c = c[10...-2]
# # # # # # # # #

# # # # # # # #
# values = '{
#   "recipient": {
#     "name": "Jake McFriend"
#   }
# }'
#
# headers = {
#   :content_type => 'application/json',
#   :authorization => 'Bearer ' + c
# }
#
# response = RestClient.post 'https://coolpay.herokuapp.com/api/recipients', values, headers
# puts response
# # #  # # # # #
