class IncomesController < ApplicationController
    def new
        if params[:id] && @user = User.find_by_id(params[:id])
            @income = @user.incomes.build
        end
    end
end
