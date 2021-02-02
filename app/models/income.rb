class Income < ApplicationRecord
  belongs_to :user
  belongs_to :planner

  validates :source, :presence => true
  validates :amount, :numericality => {:greater_than_or_equal_to => 1}
end
