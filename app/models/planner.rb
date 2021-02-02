class Planner < ApplicationRecord
  belongs_to :user

  has_many :incomes
  has_many :savings
  has_many :expenses

  validates :month, :presence => true
  validates :financial_goal, :presence => true

  def income_attributes=(attributes)
    income = self.incomes.build(attributes)
    income.user_id = self.user_id
  end

  def total_incomes
    Income.where(:user_id => self.id).sum("amount")
  end

  def total_savings
    Saving.where(:user_id => self.id).sum("amount")
  end

  def total_expenses
    Expense.where(:user_id => self.id).sum("amount")
  end
end
