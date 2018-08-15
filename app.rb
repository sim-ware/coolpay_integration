require 'sinatra'
require './lib/payment_handler'
require './lib/recipient_handler'
require './lib/auth'


get '/' do
  erb :login
end


get '/home' do
  erb :home
end

post '/home' do
  @@auth = Auth.new
  @@auth.authenticate(params[:username], params[:apikey])
  if Auth.authorized
    erb :home
  else
    erb :fail
  end
end


get '/recipients/add' do
  erb :create_recipient
end

post '/recipients/add' do
  recipientHandler = RecipientHandler.new
  @ans = recipientHandler.add_recipient(@@auth, params[:recipientname])
  erb :confirm_recipient
end


get '/payments/show' do
  paymentHandler = PaymentHandler.new
  @ans = paymentHandler.list_successful_payments(@@auth)
  erb :payments
end


get '/payments/add' do
  erb :create_payment
end

post '/payments/add' do
  paymentHandler = PaymentHandler.new
  @ans = paymentHandler.send_payment(@@auth, params[:amount], params[:currency], params[:recipientid])
  erb :confirm_payment
end
