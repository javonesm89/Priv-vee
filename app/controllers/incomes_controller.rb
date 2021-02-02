class IncomesController < ApplicationController    
    
    def new
        if session[:user_id] && @planner = Planner.find_by_id(params[:planner_id])
            @income = @planner.incomes.build
        end
    end

    def create
        if session[:user_id] && Planner.find_by(:id => params[:planner_id])
            @income = Income.new(income_params)
            if @income.save
                redirect_to planner_path(@income.planner)
            else
                render :new
            end
        end
    end

    private

    def income_params
        params.require(:income).permit(:source,:amount,:user_id,:planner_id)
    end

end
