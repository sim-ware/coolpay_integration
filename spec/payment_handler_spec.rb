require "auth"
require "payment_handler"


describe PaymentHandler do
  before(:each) do
    @paymentHandler = PaymentHandler.new
  end

  describe ".list_payments" do
    context "lists all Successful Payments" do
      it "returns a string JSON of all Payments" do
        expect(@paymentHandler.list_payments()).to include("payments")
      end
    end
  end
end
