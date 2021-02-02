class PlannersController < ApplicationController
    
    def show
        if session[:user_id] && @user = User.find_by(:id => params[:user_id])
            @planner = Planner.find_by(:id => params[:user_id])
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
            redirect_to user_path(@planner.user_id)
        else
            @errors = @planner.errors.full_messages
            render :new
        end
    end

    def update
        @planner = Planner.find_by(:id => params[:id])
        @planner.update(planner_params)
        if @planner.save
            redirect_to user_planner_path(@planner.user_id)
        else
            render :edit
        end
    end

    private

    def planner_params
        params.require(:planner).permit(:month,:user_id,:financial_goal,:income_attributes => [:source,:amount,:user_id])
    end
end
