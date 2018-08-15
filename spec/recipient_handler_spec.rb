require "auth"
require "recipient_handler"


describe RecipientHandler do
  before(:each) do
    @authorizer = Auth.new
    @authorizer.authenticate('SamirG','ADA8772865C0CA3C')
    @recipientHandler = RecipientHandler.new
    @name = "Frank Book"
  end

  describe ".add_recipient" do
    context "adds a Recipient, by Name" do
      it "returns a JSON of added Recipient" do
        expect(@recipientHandler.add_recipient(@name, @authorizer)).to include("Frank Book")
      end
    end
  end
end
