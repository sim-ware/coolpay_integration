require "rest_client"
require_relative "auth"
require "json"


class PaymentHandler
  URL = 'https://coolpay.herokuapp.com/api/payments'


  def list_successful_payments(auth)
    token = auth.refresh_token
    headers = auth.add_token_to_header(token)
    response = RestClient.get 'https://coolpay.herokuapp.com/api/payments', headers
    json_hash = JSON.parse(response.body)["payments"]

    return json_hash.select {|payment| payment["status"] == "paid" }
  end


  def send_payment(auth, recipient_id, amount, currency)
    token = auth.refresh_token
    headers = auth.add_token_to_header(token)

    values = '{
      "payment": {
        "amount": '+auth.add_double_quotes(amount)+',
        "currency": '+auth.add_double_quotes(currency)+',
        "recipient_id": '+auth.add_double_quotes(recipient_id)+'
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
