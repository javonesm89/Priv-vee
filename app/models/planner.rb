class Planner < ApplicationRecord
  belongs_to :user

  has_one :income, through: :user
  has_many :savings
  has_many :expenses
end
