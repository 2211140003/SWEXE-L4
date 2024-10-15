class SessionsController < ApplicationController
  def create
    user = User.find_by(uid: params[:uid])
    if user && BCrypt::Password.new(user.pass) == params[:pass]
      session[:login_uid] = user.uid
      redirect_to top_main_path
    else
      render 'error', status: 422
    end
  end

  def destroy
    session.delete(:login_uid)
    redirect_to root_path
  end
end
