class User < ApplicationRecord
  audited except: :password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :generate_bank_account

  validates :username, presence: true

  has_one :bank_account, :dependent => :destroy
  has_many :transactions, through: :bank_account

  scope :all_except, ->(user) { where.not(id: user) }

  def add_credit(amount)
    self.bank_account.make_transfer(amount, 'deposit')
  end

  def bank_account_id
    self.bank_account.id
  end

  def has_balance_positive?
    self.bank_account.balance >0
  end
  private

  def generate_bank_account
    account = BankAccount.new
    self.bank_account = account
  end
end
