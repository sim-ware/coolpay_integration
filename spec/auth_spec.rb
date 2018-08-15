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
end
