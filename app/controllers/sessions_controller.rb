class SessionsController < ApplicationController
    def new
    end

    def create

    end

    def destroy
        redirect_to root_path if session.clear
    end
end
