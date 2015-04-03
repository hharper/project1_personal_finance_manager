require_relative 'spec_helper'
require_relative '../lib/personal_finance_db'
require_relative '../lib/personal_finance_methods'
require_relative '../lib/personal_finance_classes'

################
##ACCOUNT TEST##
################

#pending test:#

describe "account" do
 it "has a balance"
 it "has transactions"
end

#working test:#

describe Account do
  it "has a balance" do
    account = Account.new(5000)
    expect (account.balance).to eq(5000)
  end
  it "has transactions" do
    account = Account.new
    expect (account.transaction).to be_true
  end
end

##################
#TRANSACTION TEST#
##################

#pending test:#

describe "transaction" do
  it "belongs to one account"
  it "has a date"
  it "has a payee"
  it "has a category"
  it "has an amount"
end

#working test:#

describe Transaction do
  it "belongs to an account" do
    transaction = Transaction.new(1)
    expect (transaction.account_id).to eq(1)
  end
  it "has a date" do
    transaction = Transaction.new(12/28/14)
    expect (transaction.date).to eq(12/28/14)
  end
  it "has a payee" do
    transaction = Transaction.new("Target")
    expect (transaction.payee).to eq("Target")
  end
  it "has a category" do
    transaction = Transaction.new("food")
    expect (transaction.category).to eq("food")
  end
  it "has an amount" do
    transaction = Transaction.new(100)
    expect (transaction.amount).to eq(100)
  end
end


###########################
#INSTANCE METHODS TESTS#
###########################

#pending tests:#

describe "#update_balance" do

  context "when the transaction is a credit (credit boolean == true)" do
    it "adds the transaction amount to its account balance"
    end

  context "when the transaction is not a credit (credit boolean == false)" do
    it "substracts the transaction amount from its account balance"
  end

end

describe "#list_all_accounts" do
  it "lists each account in the program with its corresponding balance"
end

describe "#get_account" do
  it "gets the account id number from the user"
end

describe "#list_current_balance" do
  it "lists the current balance of all accounts"
end

describe "#add_transaction" do
  it "adds a transaction with all of user input into the transaction database, also updating the corresponding account balance with a new amount"
end

describe "#edit_transaction" do
  it "allows the user to edit a specified transaction's information, also updating the corresponding account balance with a new amount"
end

describe "#remove_transaction" do
  it "allows the user to delete a specified transaction, also updating the corresponding account balance with a new amount"
end

describe "#view_transaction_by_category" do
  it "lists all transaction categories with their corresponding amount totals"
end
