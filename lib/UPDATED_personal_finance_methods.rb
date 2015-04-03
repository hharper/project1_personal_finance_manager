
#PSEUDO CODE#
#for each transaction, if the transaction is a credit (+), add its amount to the current account balance
#else, if the transaction is NOT a credit (-), subtract its amount from the current account balance

def update_balance(transaction_id)
  transaction = Transaction.find(transaction_id)
  account = transaction.account
  balance = account.balance

    if transaction.credit == true
      account.update(balance: balance + transaction.amount)
    else
      account.update(balance: balance - transaction.amount)
    end
  end



def list_all_accounts
  Account.all.each do |account|
    puts "Account # #{account.id} with a balance of $#{account.balance}."
  end
end


def get_account
  puts "Which account?"
  list_all_accounts
  return gets.chomp.to_i
end


def list_current_balance
  #lists balance of all accounts
  Account.all.each do |account|
    puts "Current balance of account #{account.id} is $#{account.balance}"
  end
end


def list_all_transactions(account_id)
  #lists all transactions for specified account
  account = Account.find(account_id)
  account.transactions.each do |transaction|
    puts "Transaction # #{transaction.id}, on #{transaction.date}, to #{transaction.payee}, in the cateogry of:#{transaction.category}, for $#{transaction.amount}"
  end

end


def add_transaction(account_id)
  account = Account.find(account_id)

  puts "What is the date of this transaction? mm/dd/yy"
  date = gets.chomp
  puts "Who is the payee?"
  payee = gets.chomp
  puts "What category does the transaction belong to? Please type out your choice based on the following list:"
  ##puts list of categories - user to type out
  puts "
  income
  rent
  transportation
  food
  shopping
  entertainment
  personal care"
  category = gets.chomp.downcase
  if !["income", "rent", "transportation", "personal care", "entertainment", "shopping", "food"].include?(category)
    puts "#{category} is not a valid category. Please type a valid category from the given list above."
    category = gets.chomp.downcase
  end

  puts "What is the total amount of the transaction?"
  amount = gets.chomp
  puts "Is it a credit? Indicate 'yes' or 'no'"
  credit = gets.chomp.downcase

    if credit == "yes"
      credit = true
    elsif credit == "no"
      credit = false
    else
      credit = nil
    end

  #account.transactions.create(date: date, payee: payee, category: category, amount: amount, credit: credit)
  ##instead of .create, use .new and check .valid? if valid, proceed to .save, if not valid, puts errors#

  #account.transactions.new(date: date, payee: payee, category: category, amount: amount, credit: credit)

  a = account.transactions.new(date: date, payee: payee, category: category, amount: amount, credit: credit)

  a.valid?
    if a.valid?
      a.save
      puts "Your entry is valid"
    else
      puts a.errors.messages
      puts "Your entry is invalid"
    end


  #account.transactions.last.id:
  #this grabs the last transaction's id number
  transaction_id = account.transactions.last.id

  update_balance(transaction_id)

  puts "Thank you. Your transaction has been added."

end


def edit_transaction(account_id)
  list_all_transactions(account_id)

  puts "Which transaction would you like to edit?"

  transaction_id = gets.chomp.to_i

  transaction = Transaction.find(transaction_id)

  puts "What is the updated date? mm/dd/yy"
  new_date = gets.chomp
  puts "What is the updated payee?"
  new_payee = gets.chomp
  puts "What is the updated category? Please type out your choice based on the following list:"
  puts "
  income
  rent
  transportation
  food
  shopping
  entertainment
  personal care"
  new_category = gets.chomp
  if !["income", "rent", "transportation", "personal care", "entertainment", "shopping", "food"].include?(new_category)
    puts "#{new_category} is not a valid category. Please type a valid category from the given list above."
    new_category = gets.chomp.downcase
  end


  # if new_category != "income"|| new_category != "rent"||new_category != "transportation"||new_category != "food"||new_category != "shopping"||new_category != "entertainment"||new_category != "personal care"
  #   puts "#{category} is not a valid category. Please type a valid category from the given list above."
  #   new_category = gets.chomp.downcase #this would allow user to re-enter valid 'new_category'
  # end

  puts "What is the updated amount?"
  new_amount = gets.chomp

  puts "Is it a credit? Indicate 'yes' or 'no'"
  credit = gets.chomp.downcase

  if credit == "yes"
    credit = true
  elsif credit == "no"
    credit = false
  else
    credit = nil
  end

  a = transaction.update(date: new_date, payee: new_payee, category: new_category, amount: new_amount, credit: credit)

  # a = account.transaction.new(date: new_date, payee: new_payee, category: new_category, amount: new_amount, credit: credit)

  # a.valid?
  #   if a.valid?
  #     a.save
  #     puts "Your entry is valid"
  #   else
  #     puts a.errors.messages
  #     puts "Your entry is invalid"
  #   end

  #this updates the balance of the account
  update_balance(transaction.id)

puts "Thank you. The transaction has been updated."

end



def remove_transaction(account_id)
  puts "Which transaction would you like to remove?"
  list_all_transactions(account_id)
  transaction_id = gets.chomp.to_i

  #this updates the balance of the account
  update_balance(transaction_id)

  Transaction.find(transaction_id).delete
  puts "Transaction has been removed"
  #edit the above phrase once you confirm the account balance changes

end


def view_transaction_by_category
  puts "Below are all categories from all of your accounts with their transaction totals: "

total_category_amount = Transaction.find_by_sql("SELECT category, SUM(amount) AS totalamount FROM transactions GROUP BY category ORDER BY totalamount DESC")


total_category_amount.each do |total|
  puts "#{total.category}: $#{total.totalamount}"
end


end
