class FollowsController < ApplicationController
  def create # rubocop:disable MethodLength
    if session['access_token'] && session['access_token_secret']
      begin
        @user = User.new(client)
        @new_friends = @user.follow_list(*params[:list].split('/'))
        if @new_friends.size.zero?
          flash.now[:notice] = 'You are already following everyone on this list.'
        elsif @new_friends.size == 1
          flash.now[:notice] = 'You are now following 1 new person.'
        else
          flash.now[:notice] = "You are now following #{@new_friends.size} new people."
        end
      rescue Twitter::Error::BadRequest
        flash.now[:notice] = 'You have been rate-limited by Twitter. Please try again in an hour.'
      end
      render 'sessions/show'
    else
      redirect_to failure_path
    end
  end
end
