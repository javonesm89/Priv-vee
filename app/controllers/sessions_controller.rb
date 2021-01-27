class SessionsController < ApplicationController
    def new
    end

    def create
        if !params[:email]
            flash[:alert] = "UNABLE TO LOGIN. TRY AGAIN."
            redirect_to login_path
        end
    end

    def destroy
        redirect_to root_path if session.clear
    end
end
