class BankAccount < ApplicationRecord
  #Add audit_comment as a attr
  audited
  belongs_to :user

  validates :user, presence: true
  validates :balance, presence: true, numericality: true

  has_many :account_transactions, class_name: "Transaction"

  before_validation :set_defaults

  def make_transfer(amount,trans_type)
    if trans_type == 'deposit'
      transaction  = Transaction.create(amount:amount, transaction_type: trans_type, bank_account: self)
      if(transaction.save)
        self.balance += amount
        self.save!
      else
        return false
      end

    end

    if trans_type == 'withdrawal'
      if(self.balance >= amount)
          transaction  = Transaction.create(amount:amount, transaction_type: trans_type, bank_account: self)
          if(transaction.save)
            self.balance -= amount
            self.save!
          else
            return false
          end
      else
        return false
      end
    end
  end

  def can_withdrawal?(amount)
    self.balance >= amount
  end

  private
  def set_defaults
    if self.new_record?
      self.balance = 0.00
      self.audit_comment = "New account for #{user.username}"
    end
  end
end
