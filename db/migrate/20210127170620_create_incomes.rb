class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.string :source
      t.integer :amount
      t.references :user, null: false, foreign_key: true
      t.references :planner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
