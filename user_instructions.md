SET UP INSTRUCTIONS:

CREATING YOUR DATABASE:

1. Open psql

2. create a database: CREATE DATABASE finance_db

3. \l to make sure database exists

4. \c to connect to finance_db

[ensure you get message: "You are now connected to database "finance_db" as user "username"]

5. go to bash terminal, and ensure you are in the lib directory under the parent directory (project1_personal_finance_manager)

6. run the seeds file to populate database: ruby personal_finance_seeds.rb

7. run controller file: "ruby personal_finance_seeds.rb"

8. To ensure your tables were created and populated, go back to SQL and \d to view schema [accounts and transactions should be present]
	to view your accounts: SELECT * FROM accounts;
	to view your transactions: SELECT * FROM transactions;

9. In bash, to run the program, rub: "ruby personal_finance_menu.rb"

10. Enjoy the personal finance manager!!

####
