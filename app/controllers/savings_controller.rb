class SavingsController < ApplicationController
    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @saving = @user.savings.build
            @incomes = @user.incomes
        end
    end

    def create
        binding.pry
    end
end
