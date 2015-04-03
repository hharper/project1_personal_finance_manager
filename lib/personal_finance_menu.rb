
require_relative 'personal_finance_db'
require_relative 'personal_finance_methods'
require_relative 'personal_finance_classes'

#require 'pry'

puts "Welcome to the Personal Finance Manager!\n"

while true
  puts "************************"
  puts "Please Select an Option:"
  puts "************************"
  puts "1. View Current Balance"
  puts "2. See List of Transactions"
  puts "3. Add New Transaction"
  puts "4. Edit Previous Transaction"
  puts "5. Delete Previous Transaction"
  puts "6. View Transactions by Category"
  puts "7. Exit Personal Finance Manager\n"
  user_choice = gets.chomp.to_i
  while user_choice == 0
    puts "Please select a valid option."
    user_choice = gets.chomp.to_i
  end

  case user_choice

  when 1
    list_current_balance
  when 2
    list_all_transactions(get_account)
  when 3
    add_transaction(get_account)
  when 4
    edit_transaction(get_account)
  when 5
    remove_transaction(get_account)
  when 6
    view_transaction_by_category
  when 7
    puts "Thank you for using the Personal Finance Manager. Good-bye!"
    break
  else
    puts "Invalid option. Please select from the list above."
  end
end

#binding.pry
