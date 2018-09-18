class TransactionsController < ApplicationController

  def create
    if(make_withdrawal)
      make_deposit
      flash[:notice] = "Your transfer was made successfully"
      redirect_to authenticated_root_path
    else
      flash[:alert] = "There were some problems with your transfer!"
      redirect_to bank_account_transfer_path
    end

  end

  private

  def transaction_params
    params.require(:transaction).permit(:bank_account_id,:amount, :sender)
  end

  def make_deposit
    main_account = BankAccount.find(transaction_params[:bank_account_id])
    amount = transaction_params[:amount].to_i

    main_account.make_transfer(amount, 'deposit')
  end

  def make_withdrawal
    main_account = BankAccount.find(transaction_params[:sender])
    amount = transaction_params[:amount].to_i

    main_account.make_transfer(amount, 'withdrawal') unless !main_account.can_withdrawal?(amount)

  end
end
