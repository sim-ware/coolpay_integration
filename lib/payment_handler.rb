require "rest_client"
require "auth"
require "json"


class PaymentHandler
  URL = 'https://coolpay.herokuapp.com/api/payments'
  AUTHORIZER = Auth.new

  def list_payments()
    token = AUTHORIZER.authenticate('SamirG', 'ADA8772865C0CA3C')
    headers = AUTHORIZER.add_token_to_header(token)
    
    return RestClient.get URL, headers
  end


  def list_payments_by_name(recipient_name)
  end


  def list_successful_payments()
    token = AUTHORIZER.authenticate('SamirG', 'ADA8772865C0CA3C')
    headers = AUTHORIZER.add_token_to_header(token)
    response = RestClient.get 'https://coolpay.herokuapp.com/api/payments', headers
    json_hash = JSON.parse(response.body)["payments"]

    return json_hash.select {|payment| payment["status"] == "paid" }
  end


  def send_payment(recipient_id, amount, currency)
    token = AUTHORIZER.authenticate('SamirG', 'ADA8772865C0CA3C')
    headers = AUTHORIZER.add_token_to_header(token)

    values = '{
      "payment": {
        "amount": '+AUTHORIZER.add_double_quotes(amount)+',
        "currency": '+AUTHORIZER.add_double_quotes(currency)+',
        "recipient_id": '+AUTHORIZER.add_double_quotes(recipient_id)+'
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
