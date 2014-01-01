class User
  def initialize(client)
    @client = client
  end

  def follow_list(user, list)
    users_to_follow = @client.list_members(user, list, :skip_status => true, :include_entities => false).to_a
    num_attempts = 0
    begin
      num_attempts += 1
      @client.follow(users_to_follow)
    rescue Twitter::Error::TooManyRequests => error
      if num_attempts <= 3
        sleep error.rate_limit.reset_in
        retry
      else
        raise
      end
    rescue Twitter::Error
      sleep 1
      retry
    end
  end
end
