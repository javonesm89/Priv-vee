class PlannersController < ApplicationController
    
    def show
        binding.pry
        if session[:user_id] && @user = User.find_by(:id => params[:user_id])
            @planner = Planner.new(:user_id => @user.id)
        else
            flash[:error] = 'NOPE!'
            redirect_to root_path
        end
    end
    
    def new
        if session[:user_id] && @user = User.find_by(:id => params[:user_id])
            @planner = Planner.new(:user_id => @user.id)
        else
            flash[:error] = 'NOPE!'
            redirect_to root_path
        end
    end

    def create
        @planner = Planner.new(planner_params)
        if @planner.save
            redirect_to user_planner_path(@planner,user.id)
        else
            @errors = @planner.errors.full_messages
            render :new
        end
    end

    private

    def planner_params
        params.require(:planner).permit(:month,:user_id)
    end
end
