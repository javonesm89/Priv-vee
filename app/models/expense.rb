class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :planer

  validates :source, :presence => true
  validates :amount, :numericality => {:greater_than_or_equal_to => 1}
end


