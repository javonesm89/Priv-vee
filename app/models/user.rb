class User < ApplicationRecord
    validates :name, :presence => true
    validates :email, :presence => true
    validates :email, :uniqueness => true
    validates :password, :presence => true
    
    has_secure_password

    has_many :incomes
    has_many :savings
    has_many :expenses
end
