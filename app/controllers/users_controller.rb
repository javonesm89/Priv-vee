class UsersController < ApplicationController
    def show
        if params[:id] && @user = User.find_by(:id => session[:user_id])
            if @user 
                @user 
            end
        else
            flash[:alert] = 'MUST BE A MEMBER!'
            redirect_to root_path
        end
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:alert] = 'UNABLE TO REGISTER!'
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:name,:password,:email)
    end
end
