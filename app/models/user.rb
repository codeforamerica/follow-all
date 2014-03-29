class User
  def initialize(client)
    @client = client
  end

  def follow_list(user, list)
    users_to_follow = @client.list_members(user, list, skip_status: true, include_entities: false).to_a
    @client.follow(users_to_follow)
  end
end
