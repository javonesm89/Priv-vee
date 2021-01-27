class User < ApplicationRecord
    has_secure_password
    
    validates :name, :presence => true
    validates :email, :presence => true
    validates :password, :presence => true

    has_many :incomes
    has_many :savings
    has_many :expenses
end
