class SavingsController < ApplicationController
    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @saving = @user.savings.build
            @incomes = @user.incomes
        end
    end

    def create
        if session[:user_id] && User.find_by(:id => session[:user_id])
            @saving = Saving.new(savings_params)
            if @saving.save
                redirect_to user_path(@saving.user)
            else
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
