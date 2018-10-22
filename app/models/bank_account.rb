class BankAccount < ApplicationRecord
  belongs_to :user
  audited
  require 'exceptions'

  validates :user, presence: true
  validates :balance, presence: true, numericality: true

  has_many :account_transactions, class_name: "Transaction"

  before_validation :set_defaults

  def deposit(amount)
    self.balance += amount
    create_transaction(amount,'deposit')
    self.save
  end

  def withdraw(amount)
    if (can_withdraw?(amount))
      self.balance -= amount
      create_transaction(amount,'withdrawal')
      self.save
    else
      raise Exceptions::InsufficientFundsError.new
    end
  end



  def can_withdraw?(amount)
    self.balance >= amount
  end

  private
  def set_defaults
    if self.new_record?
      self.balance = 0.00
      self.audit_comment = "New account for #{user.username}"
    end
  end

  def create_transaction(amount,trans_type)
    transaction  = Transaction.create(amount:amount, transaction_type: trans_type, bank_account: self)
    transaction.save
  end
end
