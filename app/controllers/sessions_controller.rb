class SessionsController < ApplicationController
  def session_params
    params.require(:user).permit(:user_id, :email)
  end
  
  def new
      # new will be associated with establishing login sessions
  end
    
  def create
    # create will also be associated with establishing login sessions
    if User.where(user_id: session_params[:user_id], email: session_params[:email]).blank?
      flash[:notice] = "Invlaid user-ID/email combination."
      redirect_to login_path
    else
      user = User.find_by_user_id(session_params[:user_id])
      session[:session_token] = user[:session_token]
      flash[:notice] = "You have successfully logged in!"
      redirect_to movies_path
    end
  end

  def destroy
      # destroy will handle the logout process
      reset_session
      redirect_to movies_path
  end
end
