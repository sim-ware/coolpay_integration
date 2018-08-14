require "rest_client"
require "./lib/auth"

frank_book = "8be5c2ba-19fc-4ef6-9d12-d870293578af"
jake_mcfriend = "69401e87-182e-4cf7-b4a4-895da78baa20"
jake_mcfriend_wrong = "69401e87-182e-4cf7-b4a4-895da78baa23"
currency = "USD"
amount = 10.5

# # # # # # #
a = Auth.new
b = a.authenticate('SamirG', 'ADA8772865C0CA3C')
c = b.body
c = c[10...-2]
# # # # # # #


# # # # # # #
recipient_id = "\"#{jake_mcfriend}\""
currency = "\"#{currency}\""
amount = "\"#{amount}\""

values = '{
  "payment": {
    "amount": '+amount+',
    "currency": '+currency+',
    "recipient_id": '+recipient_id+'
  }
}'

headers = {
  :content_type => 'application/json',
  :authorization => 'Bearer ' + c
}

# puts response
puts values
begin
  response = RestClient.post 'https://coolpay.herokuapp.com/api/payments', values, headers
rescue => e
  e.response
end
puts response
puts response.class
puts response.body
puts response.body.class
# # # # # # #
