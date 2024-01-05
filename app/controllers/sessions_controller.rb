class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      # sign_in(user)
      redirect_to root_path, notice: 'Successfully logged in'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new, status: :unauthorized # status: :unauthorized is for Rails 7+
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Successfully logged out'
  end
end
