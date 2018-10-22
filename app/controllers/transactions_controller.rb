class TransactionsController < ApplicationController
  require 'exceptions'

  def create
    origin_account = current_user.bank_account
    destination_account = BankAccount.find(transaction_params[:bank_account_id])
    amount = transaction_params[:amount].to_d

    # begin
    ActiveRecord::Base.transaction do
      origin_account.withdraw(amount)
      destination_account.deposit(amount)
      flash[:notice] = "Your transfer was made successfully"
      redirect_to authenticated_root_path
    end unless amount < 0
  rescue Exceptions::InsufficientFundsError => e
      flash[:alert] = "There were some problems with your transfer, "+e.message
      redirect_to bank_account_transfer_path
  end

  private

  def transaction_params
    params.require(:transaction).permit(:bank_account_id,:amount)
  end
end
