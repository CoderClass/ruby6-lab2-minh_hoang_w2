class SessionsController < ApplicationController
  def new
  	
  end

  def create
  	@user = User.find_by(email: params[:email])
  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id
  		flash[:success] = "Sign In Successfully"
  		redirect_to users_path
	else
		flash.now[:error] = "Invalid WRONGGG"
		render 'new'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:success] = "Sign out successfully"
  	redirect_to root_path
  end

end
