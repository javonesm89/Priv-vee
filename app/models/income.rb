class Income < ApplicationRecord
  belongs_to :user
  has_many :savings
end
