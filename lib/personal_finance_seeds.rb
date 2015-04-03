require 'active_record'
require_relative 'personal_finance_db'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :database => "finance_db"
)

CreateFinance.new

class Account < ActiveRecord::Base
end

Account.create([
  {balance: 1000.75},
  {balance: 5020.55}
  ])

class Transaction < ActiveRecord::Base
end


Transaction.create([

  {account_id: 2, date: "01/01/15", payee: "McDonalds", category: "food", amount: 6.54 , credit: false},

  {account_id: 1, date: "1/15/15", payee: "Global Prairie", category: "income", amount: 1000.00 , credit: true},

  {account_id: 2, date: "01/17/15", payee: "Uber", category: "transportation", amount: 9.88 , credit: false},

  {account_id: 2, date: "01/19/15", payee: "J.Crew", category: "shopping", amount: 90.72 , credit: false},

  {account_id: 1, date: "1/30/15", payee: "Global Prairie", category: "income", amount: 1000.00 , credit: true},

  {account_id: 1, date: "02/01/15", payee: "Connecticut Plaza", category: "rent", amount: 1000.00 , credit: false},

  {account_id: 2, date: "02/03/15", payee: "Chipotle", category: "food", amount: 10.04 , credit: false},

  {account_id: 2, date: "02/08/15", payee: "CVS", category: "personal", amount: 50.01 , credit: false},

  {account_id: 1, date: "2/15/15", payee: "Global Prairie", category: "income", amount: 1000.00 , credit: true},

  {account_id: 1, date: "2/30/15", payee: "Global Prairie", category: "income", amount: 1000.00 , credit: true},

  {account_id: 1, date: "03/01/15", payee: "Connecticut Plaza", category: "rent", amount: 1000.00 , credit: false},

  {account_id: 1, date: "3/15/15", payee: "Global Prairie", category: "income", amount: 1000.00 , credit: true},

  {account_id: 2, date: "3/16/15", payee: "WMATA", category: "transportation", amount: 30.00 , credit: false},

  {account_id: 1, date: "3/28/15", payee: "AMC", category: "entertainment", amount: 16.15 , credit: false}

  ])
