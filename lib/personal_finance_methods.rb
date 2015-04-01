# def add_account
#   puts "What is account name?"
#   id = gets.chomp
#   puts "What brand is the fridge?"
#   brand = gets.chomp
#   puts "How large is the fridge in cubic feet?"
#   size = gets.chomp.to_f
#   Fridge.create(id: id, brand: brand, size: size)
# end
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
  #list total balance from Account model: display total (do we need .last?)
  Account.all.each do |account|
    puts "Current balance of account #{account.id} is $#{account.balance}"
  end
end


def list_all_transactions(account_id)
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
  puts "What category does the transaction belong to?"
  ##puts list of categories - user to type out
  category = gets.chomp
  puts "What is the total amount of the transaction?"
  amount = gets.chomp.to_f
  puts "Is it a credit? Indicate 'yes' or 'no'"
  credit = gets.chomp.downcase

    if credit == "yes"
      credit = true
    elsif credit == "no"
      credit = false
    else
      credit = nil
    end

  account.transactions.create(date: date, payee: payee, category: category, amount: amount, credit: credit)
end


def edit_transaction(account_id)
  list_all_transactions(account_id)
  # account = Account.find(account_id)
  puts "Which transaction would you like to edit?"

  transaction_id = gets.chomp.to_i

  new_transaction = Transaction.find(transaction_id)#.update
  #is this .delete or .update? or is a method even needed?

  puts "What is the updated date? mm/dd/yy"
  new_date = gets.chomp
  puts "What is the updated payee?"
  new_payee = gets.chomp
  puts "What is the updated category?"
  new_category = gets.chomp
  puts "What is the updated amount?"
  new_amount = gets.chomp.to_f
  puts "Is it a credit? Indicate 'yes' or 'no'"
  credit = gets.chomp.downcase

  if credit == "yes"
    credit = true
  elsif credit == "no"
    credit = false
  else
    credit = nil
  end

  # new_transaction.transactions.create(date: new_date, payee: new_payee, category: new_category, amount: new_amount, credit: credit)
# binding.pry
  new_transaction.update(date: new_date, payee: new_payee, category: new_category, amount: new_amount, credit: credit)

end




def remove_transaction(account_id)
  puts "Which transaction would you like to remove?"
  list_all_transactions(account_id)
  transaction_id = gets.chomp.to_i
  Transaction.find(transaction_id).delete
  puts "Transaction has been removed"
end


def view_transaction_by_category(account_id)
  puts "Below are all categories with their transaction totals: "

total_category_amount = Transaction.find_by_sql("SELECT category, SUM(amount) AS totalamount FROM transactions GROUP BY category ORDER BY totalamount DESC")


total_category_amount.each do |total|
  puts "#{total.category}: $#{total.totalamount}"
end


end
