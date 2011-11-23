class SessionsController < ApplicationController
  def callback
    user = User.find_by_uid(auth[:uid]) || User.create_user(auth)
    session[:user_id] = user.id
    redirect_to root_path, :notice => "Signed in!"
  end

  def error
    redirect_to root_path, :notice => "Sign in with Twitter failed!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Signed out!"
  end

private
  def auth; request.env['omniauth.auth'] end
end
