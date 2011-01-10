class FollowsController < ApplicationController

  def create
    if signed_in?
      begin
        client = Client.new(session)
        @user = User.new(client)
        @new_friends = @user.follow_list(*params[:list].split('/'))
        flash[:notice] = "You are already following everyone on this list." if @new_friends.size.zero?
      rescue Twitter::BadRequest
        flash[:notice] = "You have been rate-limited by Twitter. Please try again in an hour."
      end
      render 'sessions/authenticated'
    else
      render 'sessions/unauthenticated'
    end
  end
end
