require "auth"
require "recipient_handler"

describe RecipientHandler do
  before(:each) do
    # @authorizer = Auth.new
    # @valid = ["your_username", "5up3r$ecretKey!"]
    # @invalid = ["invalid", "invalid_and_wrong"]
  end

  describe ".add_recipient" do
    context "adds a Recipient, by Name" do
      it "returns a string JSON of added Recipient" do
        # expect(@authorizer.authenticate(@invalid[0], @invalid[1])).to be_nil
        expect(@recipientHandler.add_recipient(@creds)).to include("recipient")
      end
    end
  end

  # describe ".authenticate" do
  #   context "given Valid Username and/or Password" do
  #     it "returns a random token" do
  #       # expect(@authorizer.authenticate(@valid[0], @valid[1]).code).to eql(200)
  #     end
  #   end
  # end
end
