require "auth"
require "payment_handler"


describe PaymentHandler do
  before(:each) do
    @paymentHandler = PaymentHandler.new
    @valid_deets = ["69401e87-182e-4cf7-b4a4-895da78baa20", 10.5, "USD"]
    @invalid_deets = ["69401e87-182e-4cf7-b4a4-895da78baa23", 9.9, "GBP"]
  end

  describe ".send_payment" do
    context "sends a Payment to a Recipient by ID" do
      it "returns a JSON of Successful Payment" do
        expect(@paymentHandler.send_payment(@valid_deets[0], @valid_deets[1], @valid_deets[2]).code).to eql(201)
      end
      it "returns nil if RecipientID doesn't Exist" do
        expect(@paymentHandler.send_payment(@invalid_deets[0], @invalid_deets[1], @invalid_deets[2])).to be_nil
      end
    end
  end

  describe ".list_payments" do
    context "lists all Successful Payments" do
      it "returns a JSON of all Payments" do
        expect(@paymentHandler.list_payments()).to include("payments")
      end
    end
  end
end
