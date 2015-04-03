#####
USER SET UP INSTRUCTIONS:

#####
CREATING YOUR DATABASE:

1. Open psql

2. Create a database:
			CREATE DATABASE finance_db

3. \l to make sure database exists

4. \c to connect to finance_db
			\c finance_db

[ensure you get message: "You are now connected to database "finance_db" as user "username"]

#####
POPULATE YOUR DATABASE:

5. Go to bash terminal, and go into the lib directory under the parent directory "project1_personal_finance_manager"
		cd lib

6. Run the given seeds file to populate database:
		ruby personal_finance_seeds.rb

7. To ensure your tables were created and populated, go back to psql and \d to view schema [accounts and transactions should be present]
	to view your accounts:
		SELECT * FROM accounts;
	to view your transactions:
		SELECT * FROM transactions;

#####
RUN THE PROGRAM

9. To run the program, go to bash and run the menu file:
			ruby personal_finance_menu.rb

10. Enjoy the personal finance manager!!

#####
VIEW THE USER STORIES:

https://trello.com/b/o3JRYiQM/project-1-personal-finance
