class PlannersController < ApplicationController
    before_action :set_planner, :only => [:edit,:destroy]
    def show
        if session[:user_id] && User.exists?(:id => params[:user_id])
           @planner = Planner.find_by(:id => params[:id])
        else
            flash[:alert] = 'MUST BE A MEMBER!'
            redirect_to login_path
        end
    end
    
    
    def new
        if session[:user_id] && User.exists?(:id => session[:user_id])
            @user = User.find_by(:id => session[:user_id])
            if @user
                @user
                @planner = Planner.new()
            else
                flash[:alert] = "ONLY MEMBERS CAN CREATE BUDGETS."
                redirect_to login_path
            end
        end

    end

    def create
        if session[:user_id] && User.exists?(:id => session[:user_id])
            @planner = Planner.new(planner_params)
            if @planner.save
                redirect_to user_planner_path(@planner.user_id,@planner)
            else
                @errors = @planner.errors.full_messages
                @user = User.find_by(:id => session[:user_id])
                render :new
            end
        end
    end

    def edit
    end
    
    def update
        @planner = Planner.find_by(:id => params[:id])
        @planner.update(planner_params)
        if @planner.save
            redirect_to user_planner_path(@planner.user_id)
        else
            @errors = @planner.errors.full_messages
            render :show
        end
    end

    def destroy
        binding.pry
        redirect_to user_path(@planner.user) if @planner.destroy
    end

    private

    def set_planner
        if session[:user_id] && User.exists?(:id => session[:user_id])
            @planner = params[:id]
        end
    end
    
    def planner_params
        params.require(:planner).permit(
        :month,
        :amount,
        :goal,
        :user_id,
        :income_attributes => [:source,:amount,:user_id],
        :saving_attributes => [:source,:amount,:user_id],
        :expense_attributes => [:source,:amount,:user_id])
    end
end
