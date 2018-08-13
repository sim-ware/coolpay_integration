require "auth"
require "payment_handler"


describe PaymentHandler do
  before(:each) do
    @paymentHandler = PaymentHandler.new
    # @amount
    # @currency
    # @recipient_id
    @valid_deets = [10.5, "USD", "69401e87-182e-4cf7-b4a4-895da78baa20"]
    @invalid_deets = [9.9, "GBP", "69401e87-182e-4cf7-b4a4-895da78baa23"]
  end

  describe ".send_payment" do
    context "sends a Payment to a Recipient by ID" do
      it "returns a string JSON of Successful Payment" do
        expect(@paymentHandler.send_payment(@valid_deets[0], @valid_deets[1], @valid_deets[2])).to include("recipient_id":"69401e87-182e-4cf7-b4a4-895da78baa20")
        # expect(@paymentHandler.send_payment(10.5, "USD", "69401e87-182e-4cf7-b4a4-895da78baa20")).to include("recipient_id":"69401e87-182e-4cf7-b4a4-895da78baa20")
      end
      it "returns a 422 if RecipientID doesn't Exist" do
        expect(@paymentHandler.send_payment(@invalid_deets[0], @invalid_deets[1], @invalid_deets[2])).to be_nil
      end
    end
  end

  describe ".list_payments" do
    context "lists all Successful Payments" do
      it "returns a string JSON of all Payments" do
        expect(@paymentHandler.list_payments()).to include("payments")
      end
    end
  end
end
