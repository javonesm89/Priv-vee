class PlannersController < ApplicationController
    def new
        if session[:user_id] && @user = User.find_by(:id => params[:user_id])
            @planner = @user.planners.build
            @income = @planner.incomes.build
        else
            flash[:error] = 'NOPE!'
            redirect_to root_path
        end
    end

    def create
        binding.pry
    end

    private

    def planner_params
        params.require(:planner).permit(:month)
    end
end
