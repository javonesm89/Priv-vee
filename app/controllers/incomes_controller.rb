class IncomesController < ApplicationController    
    
    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @income = @user.incomes.build
        end
    end

    def create
        if session[:user_id] && User.find_by(:id => session[:user_id])
            @income = Income.new(income_params)
            if @income.save
                redirect_to user_path(@income.user)
            else
                render :new
            end
        end
    end

    private

    def income_params
        params.require(:income).permit(:source,:amount,:user_id,:planner_attributes)
    end

end
