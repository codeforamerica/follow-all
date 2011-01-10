require 'threaded_map'

class User
  attr_reader :client, :id

  def initialize(client)
    @client = client
    user = client.user
    @id = user[:id]
  end

  def friends(options={:count => 20})
    @friends = client.friends(options).users
  end

  def friend_ids
    @friend_ids = []
    cursor = -1
    until cursor == 0
      begin
        friends = client.friend_ids(:cursor => cursor)
        @friend_ids += friends.ids
        cursor = friends.next_cursor
      rescue Twitter::ServiceUnavailable
        # This error will be raised if Twitter is temporarily unavailable.
        retry
      end
    end
    @friend_ids
  end

  def follow_list(user, list)
    new_friends = []
    cursor = -1
    until cursor == 0
      list_members = client.list_members(user, list, :cursor => cursor)
      list_members.users.threaded_map do |list_member|
        # Skip already-followed list members.
        next if friend_ids.include?(list_member.id)
        # You can't follow yourself, silly.
        next if id == list_member.id
        begin
          # If we made it this far, follow the list member.
          client.follow(list_member.id)
          new_friends << list_member
        rescue Twitter::Forbidden
          # This error will be raised if @user doesn't have permission to
          # follow list_member, for whatever reason.
        rescue Twitter::ServiceUnavailable
          # This error will be raised if Twitter is temporarily unavailable.
          retry
        end
      end
      cursor = list_members.next_cursor
    end
    new_friends
  end
end
