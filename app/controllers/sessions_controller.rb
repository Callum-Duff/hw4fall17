class SessionsController < ApplicationController
  def new
      # new will be associated with establishing login sessions
  end
    
  def create
      # create will also be associated with establishing login sessions
      flash[:notice] = "I am in the create method of SessionsController"
      redirect_to movies_path
  end

  def destroy
      # destroy will handle the logout process
  end
end
