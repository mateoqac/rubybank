class CreateBankAccounts < ActiveRecord::Migration[5.2]
  def self.up
    create_table :bank_accounts do |t|
      t.string :name
      t.decimal :balance,   :null => false, :default => 0.00, :scale => 2, :precision => 5
      t.references :user ,  :foreign_key => true, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :bank_accounts
  end
end
