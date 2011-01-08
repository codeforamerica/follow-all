require 'threaded_map'

class FollowsController < ApplicationController

  def create
    if signed_in?
      @user = client.user

      # Find all of @user's friends, so we don't attempt to re-follow people
      # @user already follows
      friends = []
      cursor = -1
      until cursor == 0
        friend_ids = client.friend_ids(:cursor => cursor)
        friends += friend_ids.ids
        cursor = friend_ids.next_cursor
      end
      user, list = params[:list].split('/')
      cursor = -1
      num_new_friends = 0
      until cursor == 0
        list_members = client.list_members(user, list, :cursor => cursor)
        list_members.users.threaded_map do |list_member|
          begin
            # This is where we skip already-followed list members
            next if friends.include?(list_member.id)
            # Also, you can't follow yourself, silly
            next if @user.id == list_member.id
            # If we made it this far, follow the list member
            client.follow(list_member.id)
            num_new_friends += 1
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
      flash[:notice] = if num_new_friends.zero?
        "You are already following everyone on this list!"
      else
        "You are now following #{num_new_friends} new people!"
      end
    end
    redirect_to(:controller => :sessions, :action => :new)
  end
end
