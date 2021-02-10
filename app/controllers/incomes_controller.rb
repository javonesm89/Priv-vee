class IncomesController < ApplicationController    
    
    def index
        if session[:user_id] && @user = User.exists?(:id => [:user_id])
            @user = User.find_by_id(params[:user_id])
            @incomes = @user.incomes
        end
    end
    
    def new
        if session[:user_id] && User.exists?(:id => session[:user_id])
            @planner = Planner.find_by_id(params[:planner_id])
        end
    end

    def create
        if session[:user_id] && User.find_by(:id => session[:user_id])
            @income = Income.new(incomes_params)
            if @income.save
                redirect_to user_path(@income.user)
            else
                @incomes = @saving.user.incomes
                @errors = @saving.errors.full_messages
                render :new
            end
        end
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
