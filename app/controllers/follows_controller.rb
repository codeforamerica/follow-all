class FollowsController < ApplicationController

  def create
    if signed_in?
      @user = client.user(session[:screen_name])

      # First, we need to find all of @user's current friends, so we don't
      # attempt to refollow people @user already follows
      friends = []
      cursor = -1
      until cursor == 0
        friend_ids = client.friend_ids(@user.id, :cursor => cursor)
        friends += friend_ids.ids
        cursor = friend_ids.next_cursor
      end
      user, list = params[:list].split('/')
      # Is reusing local variables asking for trouble? Probably.
      cursor = -1
      counter = 0
      until cursor == 0
        list_members = client.list_members(user, list, :cursor => cursor)
        list_members.users.each do |list_member|
          # This is where we skip already-followed friends
          next if friends.include?(list_member.id)
          # Also, you can't follow yourself, silly
          next if @user.id == list_member.id
          # If we made it this far, follow the list member
          client.follow(list_member.id)
          counter += 1
        end
        cursor = list_members.next_cursor
      end
      flash[:notice] = if counter.zero?
        "You are already following everyone on this list!"
      else
        "You are now following #{counter} new people!"
      end
    end
    redirect_to(:controller => :sessions, :action => :new)
  end
end
