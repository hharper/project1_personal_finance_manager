

class Account < ActiveRecord::Base
  has_many :transactions
  validates :balance, :presence => true
  ##also validate that balance is a number?
  #validates :balance, :numericality => true
end

class Transaction < ActiveRecord::Base
  belongs_to :account
  validates :date, :payee, :category, :amount, :presence => true
  validates :credit, :inclusion => { :in => [true, false] }


  # validates :date, :payee, :category, :amount, :credit, :presence => true

  #validate that date is a date (figure out how to input date...)
  #validates :category, inclusion {in: %w(income rent transportation food shopping entertainment personal care ) message: "%{value} is not a valid category"}
  #validates: amount, numericality: true
  #validates :boolean_credit, presence: true
end