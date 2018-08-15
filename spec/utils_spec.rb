require "utils"


describe Utils do
  before(:each) do
    @authorizer = Auth.new
    @utils = Utils.new
    @valid = ["your_username", "5up3r$ecretKey!"]
    @invalid = ["invalid", "invalid_and_wrong"]
  end

  describe ".add_token_to_header(token)" do
    context "adds Auth Token to Request Header" do
      it "returns string JSON of Header" do
        @authorizer.authenticate(@valid[0], @valid[1])
        token = @authorizer.refresh_token
        header = @utils.add_token_to_header(token)
        expect(header).to include(:content_type)
      end
    end
  end

  describe ".return_token(response)" do
    context "Takes the Response object and extracts the Auth Token" do
      it "returns string Auth Token" do
        @authorizer.authenticate(@valid[0], @valid[1])
        require 'rest_client'
        values = '{
          "username": "your_username",
          "apikey": "5up3r$ecretKey!"
        }'
        headers = {
          :content_type => 'application/json'
        }
        response = RestClient.post 'https://coolpay.herokuapp.com/api/login', values, headers

        expect(@utils.return_token(response)).to include('-')

      end
    end
  end

  # TODO: Not sure how to test for doublequotes :(
  # describe ".add_double_quotes(string)" do
  #   context "formats string to be parsed into JSON" do
  #     it "returns string of input wrapped in double quotes" do
  #       a = 'hey'
  #       # expect(@authorizer.authenticate(@valid[0], @valid[1])).to be true
  #       expect(a).to include("hey")
  #     end
  #   end
  # end
end
