require 'threaded_map'

class User
  attr_reader :client, :id

  def initialize(client)
    @client = client
    user = client.user
    @id = user.id
  end

  def friends(options={:count => 20})
    @friends = client.friends(options).users
  end

  def follow_list(user, list)
    users_to_follow = []
    cursor = -1
    until cursor == 0
      list_members = client.list_members(user, list, :cursor => cursor, :skip_status => true, :include_entities => false)
      users_to_follow += list_members.users
      cursor = list_members.next_cursor
    end

    friend_ids = client.friend_ids.ids

    new_friends = users_to_follow.threaded_map do |user_to_follow|
      begin
        client.follow(user_to_follow.id) unless friend_ids.include?(user_to_follow.id)
      rescue Twitter::Error::Forbidden
        # This error will be raised if the user doesn't have permission to
        # follow list_member, for whatever reason.
      rescue Twitter::Error::ServerError
        # This error will be raised if Twitter is temporarily unavailable.
        retry
      end
    end
    new_friends.compact
  end
end
