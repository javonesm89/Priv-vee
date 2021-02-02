class CreatePlanners < ActiveRecord::Migration[6.0]
  def change
    create_table :planners do |t|
      t.string :month
      t.string :goal
      t.integer :amount

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
