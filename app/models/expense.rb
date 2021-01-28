class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :income

  validates :source, :presence => true
  validates :amount, :numericality => {:greater_than => 1}
end


