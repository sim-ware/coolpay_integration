require 'sinatra'
require './lib/payment_handler'
require './lib/auth'


get '/' do
  erb :login
end

post '/home' do
  @auth = Auth.new
  @auth.authenticate(params[:username], params[:apikey])
  # if @auth.authorized
  puts Auth.authorized
  if Auth.authorized
    erb :home, :locals => {:username => params[:username], :apikey => params[:apikey]}
  else
    erb :fail
  end
end

get '/payments/show' do
  paymentHandler = PaymentHandler.new
  @ans = paymentHandler.list_successful_payments(@auth)
  erb :payments
end

get '/recipients/add' do
  erb :create_recipient
end

post '/recipients/add' do
  "Recipient " + params[:recipientname] + " Added!"
  # erb :confirm_recipient, :locals => {:recipientname => params[:username]}
end

get '/payments/add' do
  erb :create_payment
end

post '/payments/add' do
  "Payment Created!" + params[:amount] + ", " + params[:currency] + ", " + params[:recipientid] + "."
  # erb :confirm_payment, :locals => {:amount => params[:amount], :currency => params[:currency], :recipientid => params[:recipientid]}
end
