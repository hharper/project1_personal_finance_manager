describe "personal finance app" do
  it "has a user"
  it "has accounts it references"
  it "has a menu for user to choose options"
end

describe "user" do
  it "has an account" do
    user = User.new
    expect(user.account).to be_true
  end
end

describe "account" do
 it "belongs to a user"
 it "has transactions"
end

describe "transaction" do
  it "belongs to one account"
  it "belongs to a category"
  it "has a date"
  it "has a payee"
  it "has a category"
  it "has an amount"
end

describe "category" do
  it "has transactions"
  it "has a total amount per category"
end
