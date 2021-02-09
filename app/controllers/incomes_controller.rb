class IncomesController < ApplicationController    
    
    def new
        if params[:planner_id] && Planner.exists?(:id => params[:planner_id])
            @planner = Planner.find_by_id(params[:planner_id])
            @income = @planner.incomes.build
            @user = @planner.user_id
        end
    end

    def create
        if planner[:planner_id] && Planner.exists?(:id => params[:planner_id])
            @income = Income.new(income_params)
            if @income.save
                redirect_to planner_path(@income.planner)
            else
                @errors = @income.errors.full_messages
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
