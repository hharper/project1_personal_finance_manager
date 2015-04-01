# project1_personal_finance_manager
GA WDI: first project - personal finance manager app

# Personal Finance Management App

We're going to building a personal finance management app to keep track of all of our transactions and account information using ActiveRecord.

# Part 1 - Database Schemas
- Create a new database called finance_db.
- Create the database tables to model Account, Transaction and Category and their relationships and validations (see specs below).


# Part 2 - Setting up ActiveRecord
- Hook up your main ruby file to the finance_db
- Use your menu system to incorporate methods to perform the specific ActiveRecord actions.
- Populate your database (using ActiveRecord) with multiple transactions and corresponding categories (associated correctly!).

# Specs!

### Menu Spec
- Your program should have a menu that allows you to perform the following actions:
* View Current Balance
* See List of Transactions
* Add New Transaction
* Edit a Previous Transaction
* Delete a Previous Transaction
* View Transactions by Category


### Transaction Spec
* has a date
* has a payee
* has a category
* has an amount
* is either debit or credit


### Category Spec
* has a total amount per category
  *categories include:
    -income
    -rent
    -transportation
    -food
    -shopping
    -entertainment
    -personal care

### Account Spec
* has a current balance

### Validations Part
* Each transaction must have an assigned category (one chosen from the given list)
* Each transaction must either be a debit (+) or a credit (-)
* Amount must be a numeral
* The user should be able to quit the command line and not lose their transactions.


# Bonus!
- Allow filtering by date
- Support tracking multiple accounts (i.e. checking / savings), which have many transactions (a given transaction only belongs to one account)
