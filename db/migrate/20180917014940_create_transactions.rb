class CreateTransactions < ActiveRecord::Migration[5.2]
  def self.up
    create_table :transactions do |t|
      t.float :amount, :null => false, :default => 0.00
      t.integer :transaction_number, :null => false
      t.string :transaction_type, :null => false
      t.references :bank_account, :foreign_key => true, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
