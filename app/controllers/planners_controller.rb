class PlannersController < ApplicationController
    def new
        if session[:user_id] && @user = User.find_by(:id => params[:user_id])
            @planner = Planner.new(:user_id => @user.id)
        else
            flash[:error] = 'NOPE!'
            redirect_to root_path
        end
    end

    def create
        raise planner_params.inspect
    end

    private

    def planner_params
        params.require(:planner).permit(:month,:user_id,:incomes)
    end
end
