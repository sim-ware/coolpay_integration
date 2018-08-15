require "auth"


describe Auth do
  before(:each) do
    @authorizer = Auth.new
    @valid = ["your_username", "5up3r$ecretKey!"]
    @invalid = ["invalid", "invalid_and_wrong"]
  end

  describe ".authenticate" do
    context "given InValid Username and/or Password" do
      it "returns false" do
        expect(@authorizer.authenticate(@invalid[0], @invalid[1])).to be false
      end
    end
  end

  describe ".authenticate" do
    context "given Valid Username and/or Password" do
      it "returns true" do
        expect(@authorizer.authenticate(@valid[0], @valid[1])).to be true
      end
    end
  end

  describe ".refresh_token" do
    context "once Authenticated, grants an Auth Token per Request" do
      it "returns string Token" do
        @authorizer.authenticate(@valid[0], @valid[1])
        expect(@authorizer.refresh_token).to include('-')
      end
    end
  end

  describe "self.authorized" do
    context "tells user whether authentication was successful" do
      it "returns the class variable @@authorized" do
        expect(@authorizer.authenticate(@valid[0], @valid[1])).to be true
      end
      it "returns the class variable @@authorized as false when invalid" do
        expect(@authorizer.authenticate(@invalid[0], @invalid[1])).to be false
      end
    end
  end

  describe ".add_token_to_header(token)" do
    context "adds Auth Token to Request Header" do
      it "returns string JSON of Header" do
        @authorizer.authenticate(@valid[0], @valid[1])
        token = @authorizer.refresh_token
        header = @authorizer.add_token_to_header(token)
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

        expect(@authorizer.return_token(response)).to include('-')

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
