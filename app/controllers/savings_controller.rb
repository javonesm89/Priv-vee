class SavingsController < ApplicationController
    
    def index
        if session[:user_id] && User.exists?(:id => session[:user_id])
            @user = User.find_by(:id => session[:user_id])
        else
            flash[:alert]
            redirect_to login_path
        end
    end
    
    def new
        if session[:user_id] && User.exists?(:id => session[:user_id])
            @planner = Planner.find_by_id(params[:planner_id])
        end
    end

    def create
        if session[:user_id] && User.find_by(:id => session[:user_id])
            @saving = Saving.new(savings_params)
            if @saving.save
                redirect_to user_path(@saving.user)
            else
                @incomes = @saving.user.incomes
                @errors = @saving.errors.full_messages
                render :new
            end
        end
    end

    private

    def savings_params
        params.require(:saving).permit(:source,:amount,:off_percent,:income_id,:user_id)
    end
end
