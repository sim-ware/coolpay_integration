require "rest_client"
require_relative "auth"
require_relative "utils"
require "json"


class PaymentHandler
  URL = 'https://coolpay.herokuapp.com/api/payments'
  UTILS = Utils.new


  def list_successful_payments(auth)
    token = auth.refresh_token
    headers = UTILS.add_token_to_header(token)
    response = RestClient.get 'https://coolpay.herokuapp.com/api/payments', headers
    json_hash = JSON.parse(response.body)["payments"]

    return json_hash.select {|payment| payment["status"] == "paid" }
  end


  def send_payment(auth, recipient_id, amount, currency)
    token = auth.refresh_token
    headers = UTILS.add_token_to_header(token)

    values = '{
      "payment": {
        "amount": '+UTILS.add_double_quotes(amount)+',
        "currency": '+UTILS.add_double_quotes(currency)+',
        "recipient_id": '+UTILS.add_double_quotes(recipient_id)+'
      }
    }'

    begin
      response = RestClient.post URL, values, headers
    rescue => e
      e.response
    end

    return response
  end

end
