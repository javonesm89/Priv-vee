class ExpensesController < ApplicationController
    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @expense = @user.expenses.build
            @expenses = @user.expenses
        end
    end

    def create
        if session[:user_id] && User.find_by(:id => session[:user_id])
            @expense = Expense.new(expenses_params)
            if @expense.save
                redirect_to user_path(@expense.user)
            else
                render :new
            end
        end
    end

    private

    def expenses_params
        params.require(:expense).permit(:source,:amount,:income_id,:user_id)
    end
end
