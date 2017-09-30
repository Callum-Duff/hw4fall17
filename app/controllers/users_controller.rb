class UsersController < ApplicationController
    
  def user_params
    params.require(:user).permit(:id, :email)
  end
    
  def new
    # default: render 'new' template
  end
    
  def create
    #if User.exists?(id: params[:id])
    #    flash[:notice] = "Sorry, that user-id is taken. Try again."
    #else
    #@user = User.create(user_params)
    flash[:notice] = "This is a test in the create method of UsersController"
    #flash[:notice] = "Welcome #{@user.id}. Your account has been created!"
    redirect_to movies_path
    #end
    
  end
end