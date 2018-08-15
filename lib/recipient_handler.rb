require "rest_client"
require "auth"


class RecipientHandler
  URL = 'https://coolpay.herokuapp.com/api/recipients'

  def add_recipient(recipient_name, auth)
    token = auth.refresh_token

    values = '{
      "recipient": {
        "name": '+auth.add_double_quotes(recipient_name)+'
      }
    }'

    headers = auth.add_token_to_header(token)

    return RestClient.post URL, values, headers
  end

end
