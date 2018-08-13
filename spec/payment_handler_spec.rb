require "auth"
# require "recipient_handler"
require "payment_handler"

describe PaymentHandler do
  before(:each) do
    # @recipientHandler = RecipientHandler.new
    # @name = "Frank Book"
    @paymentHandler = PaymentHandler.new
  end

  describe ".list_payments" do
    context "lists all Successful Payments" do
      it "returns a string JSON of all Payments" do
        expect(@paymentHandler.list_payments()).to include("payments")
      end
      #
      # it "returns a string JSON of all Payments specified by Name" do
      #   expect(@paymentHandler.list_payments_by_name(@creds)).to include("Frank Book")
      # end
      #
    end
  end
end
