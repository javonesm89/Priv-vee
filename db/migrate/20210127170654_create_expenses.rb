class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :source
      t.string :amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
