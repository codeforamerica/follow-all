require 'threaded_map'

class FollowsController < ApplicationController

  def create
    if signed_in?
      @user = client.user

      # Find all of @user's friends, so we don't attempt to re-follow people
      # @user already follows (or @user herself)
      ids_to_skip = [@user.id]
      cursor = -1
      until cursor == 0
        friend_ids = client.friend_ids(:cursor => cursor)
        ids_to_skip += friend_ids.ids
        cursor = friend_ids.next_cursor
      end
      user, list = params[:list].split('/')
      cursor = -1
      num_new_friends = 0
      until cursor == 0
        list_members = client.list_members(user, list, :cursor => cursor)
        list_members.users.threaded_map do |list_member|
          next if ids_to_skip.include?(list_member.id)
          client.follow(list_member.id)
          num_new_friends += 1
        end
        cursor = list_members.next_cursor
      end
      flash[:notice] = if num_new_friends.zero?
        "You are already following everyone on this list!"
      else
        "You are now following #{num_new_friends} new people!"
      end
    end
    redirect_to(:controller => :sessions, :action => :new)
  end
end
