require "rest_client"
require "auth"


class RecipientHandler

  def add_recipient(recipient_name)
    a = Auth.new
    b = a.authenticate('SamirG', 'ADA8772865C0CA3C')
    # c = b.body
    # c = c[10...-2]

    recipient_name = "\"#{recipient_name}\""

    values = '{
      "recipient": {
        "name": '+recipient_name+'
      }
    }'

    headers = {
      :content_type => 'application/json',
      :authorization => 'Bearer ' + b
    }

    response = RestClient.post 'https://coolpay.herokuapp.com/api/recipients', values, headers

    return response
  end

end
