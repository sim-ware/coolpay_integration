require "rest_client"
require_relative "auth"
require_relative "utils"


class RecipientHandler
  URL = 'https://coolpay.herokuapp.com/api/recipients'
  UTILS = Utils.new

  def add_recipient(auth, recipient_name)
    token = auth.refresh_token

    values = '{
      "recipient": {
        "name": '+UTILS.add_double_quotes(recipient_name)+'
      }
    }'

    headers = UTILS.add_token_to_header(token)

    return RestClient.post URL, values, headers
  end

end
