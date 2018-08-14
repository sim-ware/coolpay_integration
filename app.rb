require 'sinatra'
require './lib/payment_handler'


get '/' do
  erb :login
end

post '/home' do
  erb :home, :locals => {:username => params[:username], :apikey => params[:apikey]}
end

get '/payments/show' do
  paymentHandler = PaymentHandler.new
  @ans = paymentHandler.list_successful_payments
  erb :payments
end

get '/recipients/add' do
  erb :recipients
end

post '/recipients/add' do
  "Recipient " + params[:recipientname] + " Added!"
end

get '/payments/add' do
  erb :create_payment
end

post '/payments/add' do
  "Payment Created!" + params[:amount] + ", " + params[:currency] + ", " + params[:recipientid] + "."
end
