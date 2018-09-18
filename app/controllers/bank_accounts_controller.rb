class BankAccountsController < ApplicationController

  def index
  end

  def transfer
    @users = User.all_except(current_user).includes(:bank_account)
    @transaction = Transaction.new
  end


end
