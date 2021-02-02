class SessionsController < ApplicationController
    def new
    end

    def create
        if params[:email] && @user = User.find_by(:email => params[:email])  
            if @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash[:alert] = "UNABLE TO LOGIN. TRY AGAIN."
                redirect_to login_path
            end
        end
    end

    def destroy
        redirect_to root_path if session.clear
    end
end
