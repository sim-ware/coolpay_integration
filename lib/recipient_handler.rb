require "rest_client"
require "auth"


class RecipientHandler
  URL = 'https://coolpay.herokuapp.com/api/recipients'
  AUTHORIZER = Auth.new

  def add_recipient(recipient_name)
    token = AUTHORIZER.authenticate('SamirG', 'ADA8772865C0CA3C')

    values = '{
      "recipient": {
        "name": '+AUTHORIZER.add_double_quotes(recipient_name)+'
      }
    }'

    headers = AUTHORIZER.add_token_to_header(token)

    return RestClient.post URL, values, headers
  end

end
