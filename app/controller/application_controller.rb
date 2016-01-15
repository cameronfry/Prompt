class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception
  before_action :authenticate

  private
  def authenticate
    if !session[:user]
      redirect_to "/sign_in"
    end
  end
end
