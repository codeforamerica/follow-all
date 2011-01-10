require 'twitter/config'

class Client < Twitter::Client
  include Twitter::Config

  def initialize(session={})
    Twitter.configure do |config|
      config.consumer_key = configuration[:consumer_key]
      config.consumer_secret = configuration[:consumer_secret]
      config.oauth_token = session[:oauth_token]
      config.oauth_token_secret = session[:oauth_token_secret]
    end
    super
  end
end
