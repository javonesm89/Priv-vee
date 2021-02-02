class ExpensesController < ApplicationController
    def new
        if session[:user_id] && @planner = Planner.find_by(:id => params[:planner_id])
            @expense = @planner.expenses.build
        end
    end

    def create
        if session[:user_id] && @user = User.find_by(:id => session[:user_id])
            @expense = Expense.new(expense_params)
            if @expense.save
                redirect_to user_path(@user)
            else
                @incomes = @user.incomes
                @errors = @expense.errors.full_messages
                render :new
            end
        end
    end

    private

    def expense_params
        params.require(:expense).permit(:source,:amount,:planner_id,:user_id)
    end
end
