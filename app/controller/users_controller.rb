class UsersController < ApplicationController
  skip_before_action :authenticate

  def sign_up
  end

  def sign_up!
    user = User.new(
      username: params[:username],
      password_digest: BCrypt::Password.create(params[:password])
    )
    if params[:password_confirmation] != params[:password]
      message = "Your passwords don't match!"
    elsif user.save
      message = "Your account has been created!"
      flash[:notice] = message
    else
      message = "Your account couldn't be created. Did you enter a unique username and password?"
    end
    puts message
    redirect_to action: :sign_up
  end

  def sign_in
  end

  def sign_in!
    @user = User.find_by(username: params[:username])
    if !@user
      message = "This user doesn't exist!"
    elsif !BCrypt::Password.new(@user.password_digest).is_password?(params[:password])
      message = "Your password's wrong!"
    else
      message = "You're signed in, #{@user.username}!"
      flash[:notice] = message
      cookies[:username] = {
      value: @user.username,
      expires: 20.years.from_now
    }
      session[:user] = @user
    end
    puts message
    redirect_to action: :sign_in
  end

  def sign_out
    message = "You're signed out!"
    flash[:notice] = message
    reset_session
    redirect_to root_url
  end

end
