class Income < ApplicationRecord
  belongs_to :user
  belongs_to :planner

  validates :source, :presence => true
  validates :amount, :numericality => {:greater_than => 1}
end
