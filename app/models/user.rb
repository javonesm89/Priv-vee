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

    def adjust_for_taxes
        case self.income
        when (10001..40000)
            taxable_amount = self.salary - 10000
            money_to_sam = taxable_amount * 0.13 + 1000
            money_to_ss = self.salary * 0.0145
            money_to_medicare = self.salary * 0.029
            nonsense_money = money_to_medicare + money_to_ss + money_to_sam
            self.salary = self.salary - nonsense_money.round(2)
        when (40001..90000)
            taxable_amount = self.salary - 40000
            money_to_sam = taxable_amount * 0.23 + 4700
            money_to_ss = self.salary * 0.0145
            money_to_medicare = self.salary * 0.029
            nonsense_money = money_to_medicare + money_to_ss + money_to_sam
            self.salary = self.salary - nonsense_money.round(2)
        when (90001..180000)
            taxable_amount = self.salary - 90000
            money_to_sam = taxable_amount * 0.25 + 14700
            money_to_ss = self.salary * 0.0145
            money_to_medicare = self.salary * 0.029
            nonsense_money = money_to_medicare + money_to_ss + money_to_sam
            # binding.pry
            self.salary = self.salary - nonsense_money.round(2)
        when (180001..300000)
            taxable_amount = self.salary - 180000
            money_to_sam = taxable_amount * 0.33 + 33000
            money_to_ss = self.salary * 0.0145
            money_to_medicare = self.salary * 0.029
            nonsense_money = money_to_medicare + money_to_ss + money_to_sam
            self.salary = self.salary - nonsense_money.round(2)
        when (300001..500000)
            taxable_amount = self.salary - 300000
            money_to_sam = taxable_amount * 0.35 + 48000
            money_to_ss = self.salary * 0.0145
            money_to_medicare = self.salary * 0.029
            nonsense_money = money_to_medicare + money_to_ss + money_to_sam
            self.salary = self.salary - nonsense_money.round(2)
        else (0..10)
            money_to_sam = self.salary * 0.1
            money_to_ss = self.salary * 0.0145
            money_to_medicare = self.salary * 0.029
            nonsense_money = money_to_medicare + money_to_ss + money_to_sam
            self.salary = self.salary - nonsense_money.round(2)
        end
    end


    # def total_investments
    #     total_expenses = Investment.where(:user_id => self.id).sum("amount")
    # end
end
