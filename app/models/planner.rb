class Planner < ApplicationRecord
  belongs_to :user

  has_many :incomes
  has_many :savings
  has_many :expenses

  validates :month, :presence => true
  validates :financial_goal, :presence => true

  def incomes_attributes=(attributes)
      self.incomes << Income.create(attributes)
  end
end
