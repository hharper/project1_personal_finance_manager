

class Account < ActiveRecord::Base
  has_many :transactions
  validates :balance, :presence => true
end

class Transaction < ActiveRecord::Base
  belongs_to :account
  validates :date, :payee, :category, :amount, :presence => true
  validates :credit, :inclusion => { :in => [true, false] }
  validates :category, :inclusion => { in: %w(income rent transportation food shopping entertainment personal ), message: "%{value} is not a valid category"}
  validates :amount, :numericality => true
end
