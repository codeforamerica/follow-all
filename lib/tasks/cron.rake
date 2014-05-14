require 'twitter'
require 'logger'
logger = Logger.new(STDOUT)
logger.level = Logger::DEBUG

desc "Automatically merge the staff and fellows Twitter lists into the team list"
task cron: :environment do
  client = Twitter::REST::Client.new do |config|
    config.consumer_key = ENV['CONSUMER_KEY']
    config.consumer_secret = ENV['CONSUMER_SECRET']
    config.access_token = ENV['OAUTH_TOKEN']
    config.access_token_secret = ENV['OAUTH_TOKEN_SECRET']
  end

  user = 'codeforamerica'
  ["bod", "staff", "fellows-#{Time.now.year}"].each do |list|
    cursor = -1
    until cursor == 0
      list_members = client.list_members(user, list, cursor: cursor)
      list_members.users.each do |list_member|
        begin
          if client.is_list_member?(user, "team", list_member.id)
            logger.debug "Skipping #{list_member.name} (id: #{list_member.id})"
          else
            logger.debug "Adding #{list_member.name} (id: #{list_member.id})"
            client.list_add_member(user, "team", list_member.id)
          end
        rescue Twitter::Forbidden
          # This error will be raised if the authenticated user doesn't have
          # permission to add the member to the list, for whatever reason.
        rescue Twitter::ServiceUnavailable
          # This error will be raised if Twitter is temporarily unavailable.
          retry
        end
      end
      cursor = list_members.next_cursor
    end
  end
end
