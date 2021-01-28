class ExpensesController < ApplicationController
    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @expense = @user.expenses.build
            @incomes = @user.incomes
        end
    end

    def create
        binding.pry
    end

    private

    def expenses_params
        params.require(:expense).permit(:source,:amount,:income_id,:user_id)
    end
end
