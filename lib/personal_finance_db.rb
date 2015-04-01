require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :database => "finance_db"
)

class CreateFinance < ActiveRecord::Migration
  def initialize
    create_table :accounts do |column|
      column.float :balance
    end

    create_table :transactions do |column|
      column.belongs_to :account
      column.string :date
      column.string :payee
      column.string :category
      column.float :amount
      column.boolean :credit
    end

  end

end

# binding.pry
