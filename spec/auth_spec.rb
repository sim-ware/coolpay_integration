require "auth"


describe Auth do
  before(:each) do
    @authorizer = Auth.new
    @valid = ["your_username", "5up3r$ecretKey!"]
    @invalid = ["invalid", "invalid_and_wrong"]
  end

  describe ".authenticate" do
    context "given InValid Username and/or Password" do
      it "returns 404" do
        expect(@authorizer.authenticate(@invalid[0], @invalid[1])).to be_nil
      end
    end
  end

  describe ".authenticate" do
    context "given Valid Username and/or Password" do
      it "returns a random token" do
        expect(@authorizer.authenticate(@valid[0], @valid[1]).code).to eql(200)
      end
    end
  end
end
