class PlannersController < ApplicationController
    def new
        if session[:user_id] && @user = User.find_by(:id => session[:user_id])
            @planner = @user.planners.build
        else
            flash[:error] = 'NOPE!'
            redirect_to root_path
        end
    end

    private

    def planner_params
        params.require(:planner).permit()
    end
end
