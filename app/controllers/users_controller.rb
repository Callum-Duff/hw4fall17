class UsersController < ApplicationController
    
  def user_params
    params.require(:user).permit(:id, :email)
  end
    
  def new
    # default: render 'new' template
  end
    
  def create
    if User.where(:userid => user_params[:userid]).blank?
      @user = User.create!(user_params)
      #flash[:notice] = "#{user_params}"
      flash[:notice] = "Welcome #{@user.userid}. Your account has been created!"
    else
      flash[:notice] = "Sorry, that user-id is taken. Try again."
    end
    redirect_to movies_path
  end
end