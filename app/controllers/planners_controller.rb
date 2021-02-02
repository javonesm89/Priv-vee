class PlannersController < ApplicationController
    def new
        # binding.pry
        if session[:user_id] && @user = User.find_by(:id => session[:user_id])
            @planner = @user.planners.build
        else
            flash[:error] = 'NOPE!'
            redirect_to root_path
        end
    end
end
