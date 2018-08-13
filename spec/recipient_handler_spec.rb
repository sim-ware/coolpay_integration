require "auth"
require "recipient_handler"

describe RecipientHandler do
  before(:each) do
    @recipientHandler = RecipientHandler.new
    @name = "Frank Book"
  end

  describe ".add_recipient" do
    context "adds a Recipient, by Name" do
      it "returns a string JSON of added Recipient" do
        expect(@recipientHandler.add_recipient(@name)).to include("recipient")
      end
    end
  end
end
