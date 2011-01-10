require 'twitter/config'

class Consumer < OAuth::Consumer
  include Twitter::Config

  def initialize(consumer_key=configuration[:consumer_key], consumer_secret=configuration[:consumer_secret], options={:site => 'http://api.twitter.com', :request_endpoint => 'http://api.twitter.com', :sign_in => true})
    super(consumer_key, consumer_secret, options)
  end
end
