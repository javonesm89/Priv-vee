class IncomesController < ApplicationController
    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @income = @user.incomes.build
        end
    end

    def create
        binding.pry
        if session[:user_id] && User.find_by(:id => session[:user_id])
            @income = Income.new(income_params)
            binding.pry
        end
    end

    private

    def income_params
        params.require(:income).permit(:source,:amount,:user_id)
    end

end
