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
      #flash[:notice] = "You are logged in as #{session_params[:user_id]}"
      token = User.find_by_user_id(session_params[:user_id]).select(:session_token).take
      session[:session_token] = token
      flash[:notice] = "session token = #{token}"
      redirect_to movies_path
    end
  end

  def destroy
      # destroy will handle the logout process
      
      redirect_to movies_path
  end
end
