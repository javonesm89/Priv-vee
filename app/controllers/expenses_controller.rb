class ExpensesController < ApplicationController
    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @expense = @user.expenses.build
            @incomes = @user.incomes
        end
    end

    def create
        if session[:user_id] && @user = User.find_by(:id => session[:user_id])
            @expense = Expense.new(expense_params)
            if @expense.save
                redirect_to user_path(@user)
            else
                @incomes = @user.incomes
                @
                render :new
            end
        end
    end

    private

    def expense_params
        params.require(:expense).permit(:source,:amount,:income_id,:user_id)
    end
end
