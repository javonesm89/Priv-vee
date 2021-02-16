class UsersController < ApplicationController
    before_action :set_user, :only => [:show,:edit,:update,:destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "CONGRATS ACCOUNT CREATED!"
            redirect_to user_path(@user)
        else
            @errors = @user.errors.full_messages
            render 'users/new'
        end
    end

    def update
            @user.update(user_params)
            if @user.save
                redirect_to user_path(@user)
            else
                @errors = @user.errors.full_messages
                render :edit
            end
    end

    def destroy
        redirect_to root_path if @user.destroy
    end

    private

    def set_user
        if session[:user_id] && User.exists?(:id => session[:user_id])
            @user = User.find_by_id(session[:user_id])
            if @user
                @user
            else
                flast[:alert] = 'MUST BE A MEMBER!'
                redirect_to login_path 
            end
        end
    end

    def user_params
        params.require(:user).permit(:name,:password,:email)
    end
end
