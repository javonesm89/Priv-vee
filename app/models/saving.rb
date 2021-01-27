class Saving < ApplicationRecord
  belongs_to :user
  belongs_to :income

  validates :source, :presence => true
  validates :amount, :numericality => {:greater_than => 25}
  validates :off_percent, :numericality => {:greater_than => 1}
end
