class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        binding.pry
    end

    private

    def user_params
        params.require(:user).permit(:name,:password,:email)
    end
end
