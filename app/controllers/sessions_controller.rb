class SessionsController < ApplicationController
    def new
    end

    def create
        if params[:email] && @user = User.find_by(:email => params[:email])  
            if @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            end
        else
            flash[:alert] = "Unable to login. Make sure e-mail and password are entered."
            redirect_to login_path
        end
    end

    def destroy
        redirect_to root_path if session.clear
    end
end
