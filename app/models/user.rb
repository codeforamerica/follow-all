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

  def follow_list(user, list)
    new_friends = []
    cursor = -1
    until cursor == 0
      list_members = client.list_members(user, list, :cursor => cursor)
      list_members.users.threaded_map do |list_member|
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
