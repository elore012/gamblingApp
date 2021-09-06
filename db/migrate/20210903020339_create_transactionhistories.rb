class CreateTransactionhistories < ActiveRecord::Migration[6.1]
  def change
    create_table :transactionhistories do |t|
      t.string :bet
      t.integer :amountofbet
      t.references :user, null: false, foreign_key:true
      t.string :result
      t.string :ifwin
      t.integer :currentpoints
      t.timestamps
    end
  end
end
