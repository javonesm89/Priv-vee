class Planner < ApplicationRecord
  belongs_to :user

  has_many :incomes
  has_many :savings
  has_many :expenses
end