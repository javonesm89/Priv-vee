class User < ApplicationRecord
    validates :name, :presence => true
    validates :email, :presence => true
    validates :email, :uniqueness => true
    validates :password, :presence => true
    
    has_secure_password

    has_many :incomes
    has_many :savings
    has_many :expenses

    def total_incomes
        total_expenses = Income.where(:user_id => self.id).sum("amount")
    end
    
    def total_expenses
        total_expenses = Expense.where(:user_id => self.id).sum("amount")
    end

    def total_savings
        total_expenses = Saving.where(:user_id => self.id).sum("amount")
    end

    # def total_investments
    #     total_expenses = Investment.where(:user_id => self.id).sum("amount")
    # end
end
