class FollowsController < ApplicationController
  def create
    if session['access_token'] && session['access_secret']
      begin
        @user = User.new(client)
        @new_friends = @user.follow_list(*params[:list].split('/'))
        flash.now[:notice] = "You are already following everyone on this list." if @new_friends.size.zero?
      rescue Twitter::BadRequest
        flash.now[:notice] = "You have been rate-limited by Twitter. Please try again in an hour."
      end
      render 'sessions/show'
    else
      redirect_to failure_path
    end
  end
end
