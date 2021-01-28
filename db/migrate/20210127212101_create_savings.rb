class CreateSavings < ActiveRecord::Migration[6.0]
  def change
    create_table :savings do |u|
      u.string :source
      u.integer :amount
      u.references :user, null: false, foreign_key: true
      u.references :income, null: false, foreign_key: true

      u.timestamps
    end
  end
end
