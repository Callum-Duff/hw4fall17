class UsersController < ApplicationController
    
  def user_params
    params.require(:user).permit(:user_id, :email)
  end
    
  def new
    # default: render 'new' template
  end
    
  def create
    if User.find_by_user_id(user_params[:user_id]).blank?
      @user = User.create_user!(user_params)
      flash[:notice] = "Welcome #{@user.user_id}. Your account has been created!"
      redirect_to login_path
    else
      flash[:notice] = "Sorry, that user-id is taken. Try again."
      redirect_to movies_path
    end
  end
end