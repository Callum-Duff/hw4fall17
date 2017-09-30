class UsersController < ApplicationController
    def user_params
        params.require(:user).permit(:id, :email)
    end
    
    def new
        # default: render 'new' template
    end
end