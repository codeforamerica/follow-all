require 'twitter/authentication_helpers'
require 'yaml'

class ApplicationController < ActionController::Base
  include Twitter::AuthenticationHelpers
  protect_from_forgery
  rescue_from Twitter::Unauthorized, :with => :force_sign_in

  private

  def oauth_consumer
    @oauth_consumer ||= OAuth::Consumer.new(configuration[:consumer_key], configuration[:consumer_secret], :site => 'http://api.twitter.com', :request_endpoint => 'http://api.twitter.com', :sign_in => true)
  end

  def client
    Twitter.configure do |config|
      config.consumer_key = configuration[:consumer_key]
      config.consumer_secret = configuration[:consumer_secret]
      config.oauth_token = session[:oauth_token]
      config.oauth_token_secret = session[:oauth_token_secret]
    end

    @client ||= Twitter::Client.new
  end
  helper_method :client

  def force_sign_in(exception)
    reset_session
    flash[:error] = "It seems your credentials are not good anymore. Please sign in again."
    redirect_to new_session_path
  end

  def config_file
    File.join(::Rails.root.to_s, "config", "twitter.yaml")
  end

  def configuration
    YAML.load(File.read(config_file))
  end
end
