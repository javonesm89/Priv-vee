class SessionsController < ApplicationController
    def new
    end

    def create
        if params[:email] && @user = User.find_by_email(params[:email])  
            if @user.authenticate(params[:password])
                redirect_to user_path(@user)
            else
                flash[:alert] = "UNABLE TO LOGIN. TRY AGAIN."
            end
        end
    end

    def destroy
        redirect_to root_path if session.clear
    end
end
