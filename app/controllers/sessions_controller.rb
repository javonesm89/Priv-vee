class SessionsController < ApplicationController
    def new
    end

    def create
        if params[:email] && @user = User.find_by_email(:email => params[:email])
            if @user.authenticate(params[:password])
                redirect_to user_path(@user)
            else
                flash[:alert] = 'UNABLE TO LOGIN. TRY AGAIN.'
                redirect_to login_path
            end
        end
    end
end
