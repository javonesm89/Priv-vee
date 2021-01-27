class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.string :source
      t.string :amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
