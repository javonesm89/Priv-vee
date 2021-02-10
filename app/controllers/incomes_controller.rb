class IncomesController < ApplicationController    
    
    def index
        if session[:user_id] && @user = User.exists?(:id => session[:user_id])
            @user = User.find_by_id(params[:user_id])
            @incomes = @user.incomes
        end
    end
    
    def new
        if session[:user_id] && @user = User.exists?(:id => session[:user_id])
            @user = User.find_by(:id => session[:user_id])
            if @user
                @planner = @user.planners.find_by(:id => params[:planner_id])
                @income = @planner.incomes.build
            else
                flash[:alert] = "ONLY MEMBERS CAN CREATE ADD INCOMES."
                redirect_to login_path
            end
        end
    end

    def create
        binding.pry
    end

    def edit
        @income = Income.find_by(:id => params[:id])
    end

    def update
        @income = Income.find_by_id(params[:id])
        @income.update(income_params)
        if @income.save
            redirect_to user_planner_path(@income.user_id,@income.planner)
        end
    end

    private

    def income_params
        params.require(:income).permit(:source,:amount,:user_id,:planner_id)
    end

end
