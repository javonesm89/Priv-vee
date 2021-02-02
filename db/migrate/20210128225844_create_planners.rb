class CreatePlanners < ActiveRecord::Migration[6.0]
  def change
    create_table :planners do |t|
      t.string :month
      t.text :financial_goal
      t.boolean :goal_met => false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
