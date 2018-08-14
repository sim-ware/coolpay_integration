require "rest_client"
require "./lib/auth"
require "json"


# # # # # # #
a = Auth.new
b = a.authenticate('SamirG', 'ADA8772865C0CA3C')
c = b.body
c = c[10...-2]
# # # # # # #


headers = {
  :content_type => 'application/json',
  :authorization => 'Bearer ' + c
}

response = RestClient.get 'https://coolpay.herokuapp.com/api/payments', headers
# puts response

x = response.body
x = JSON.parse(x)

# puts x["payments"][0]
# puts x.class

x = x["payments"]
y = x.select {|payment| payment["status"] == "paid" }
puts y


eg_rec_id = "69401e87-182e-4cf7-b4a4-895da78baa20"
z = y.select {|payment| payment["recipient_id"] == eg_rec_id }
# puts z

eg_id = "73795fc0-4ac0-492d-a45d-d5dd162a8d9d"
a = y.select {|payment| payment["id"] == eg_id }
# puts a
