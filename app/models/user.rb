class User
  attr_reader :client, :id

  def initialize(client)
    @client = client
    user = client.user
    @id = user.id
  end

  def follow_list(user, list)
    users_to_follow = []
    cursor = -1
    until cursor == 0
      list_members = client.list_members(user, list, cursor: cursor, skip_status: true, include_entities: false)
      users_to_follow += list_members.users
      cursor = list_members.next_cursor
    end

    begin
      client.follow(users_to_follow)
    rescue Twitter::Error::ServerError
      # This error will be raised if Twitter is temporarily unavailable.
      retry
    end
  end
end
