class FollowsController < ApplicationController
  before_action :ensure_authenticated

  def create
    @user = User.new(client)
    @new_friends = @user.follow_list(*params[:list].split('/'))
    flash.now[:notice] = flash_message(@new_friends.size)
    render 'sessions/show'
  end

private

  def flash_message(number)
    case number
    when 0
      'You are already following everyone on this list.'
    when 1
      'You are now following 1 new person.'
    else
      "You are now following #{number} new people."
    end
  rescue Twitter::Error::TooManyRequests
    'You have been rate-limited by Twitter. Please try again in an hour.'
  end
end
