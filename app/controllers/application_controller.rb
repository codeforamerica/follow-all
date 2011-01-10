require 'twitter/authentication_helpers'

class ApplicationController < ActionController::Base
  include Twitter::AuthenticationHelpers
  protect_from_forgery
  rescue_from Twitter::Unauthorized, :with => :force_sign_in

  private

  def force_sign_in(exception)
    reset_session
    flash[:error] = "It seems your credentials are not good anymore. Please sign in again."
    redirect_to new_session_path
  end
end
