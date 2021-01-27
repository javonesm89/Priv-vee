class IncomesController < ApplicationController
    def new
        # binding.pry
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @income = @user.incomes.build
        end
    end
end
