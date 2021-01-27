class Saving < ApplicationRecord
  belongs_to :user
  belongs_to :income

  validates :source, :presence => true
  validates :amount, :numericality => {:greater_than_or_equal_to => 0}
  validates :off_percent, :numericality => {:greater_than_or_equal_to => 0}
end
