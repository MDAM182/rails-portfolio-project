class SessionsController < ApplicationController


  def new

  end

  def create
    if auth_hash
        @user = User.find_or_create_by_omniauth(auth_hash)
        
        session[:user_id] = @user.id
        # binding.pry
        redirect_to user_path(@user)
      else
        user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] = "Logged in successfully"
        redirect_to user_path(user)
      else
        flash.now[:danger] = "There was something wrong with the login information"
        render 'new'
      end
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to root_path
  end

private

  def auth_hash
    request.env['omniauth.auth']
  end
end
