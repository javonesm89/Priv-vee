class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :planer

  validates :source, :presence => true
  validates :amount, :numericality => {:greater_than => 1}
end


