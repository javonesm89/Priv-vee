class UsersController < ApplicationController
    def show
        if session[:user_id] && User.exists?(:id => params[:id])
            if @user = User.find_by(:id => params[:id])
                @user
            else
                flash[:alert] = 'MUST BE A MEMBER!'
                redirect_to login_path
            end
        end
    end
    
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
            render :new
        end
    end

    def edit
        @user = User.find_by(:id => params[:id])
    end

    def update
        if session[:user_id] && User.exists?(:id => session[:user_id])
            @user = User.find_by(:id => params[:id])
            @user.update(user_params)
            if @user.save
                redirect_to user_path(@user)
            else
                @errors = @user.errors.full_messages
                render :edit
            end
        end
    end

    private

    def user_params
        params.require(:user).permit(:name,:password,:email)
    end
end
