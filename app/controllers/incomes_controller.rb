class IncomesController < ApplicationController
    def new
        if params[:id] && @user = User.find_by_id(params[:id])
            @user
        end
    end
end
