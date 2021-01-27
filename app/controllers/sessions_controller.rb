class SessionsController < ApplicationController
    def new
    end

    def create
        if params[:email] && @user = User.find_by(:email => params[:email])
            if @user.authenticate(params[:password])
                redirect_to user_path(@user)
            else
                binding.pry
                render :new
            end
        end
    end
end
