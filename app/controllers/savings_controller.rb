class SavingsController < ApplicationController
    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @saving = @user.incomes.build
        end
    end
end
