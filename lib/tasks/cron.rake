require 'twitter'
require 'threaded_map'
require 'logger'
logger = Logger.new(STDOUT)
logger.level = Logger::DEBUG

def config_file
  File.join(::Rails.root.to_s, 'config', 'twitter.yaml')
end

def configuration
  YAML.load(File.read(config_file))
end

desc "Automatically merge the staff and fellows Twitter lists into the team list"
task :cron => :environment do
  Twitter.configure do |config|
    config.consumer_key = configuration[:consumer_key]
    config.consumer_secret = configuration[:consumer_secret]
    config.oauth_token = configuration[:oauth_token]
    config.oauth_token_secret = configuration[:oauth_token_secret]
  end
  client = Twitter::Client.new

  user = 'codeforamerica'
  ["bod", "staff", "fellows-#{Time.now.year}"].each do |list|
    cursor = -1
    until cursor == 0
      list_members = client.list_members(user, list, :cursor => cursor)
      list_members.users.threaded_map do |list_member|
        begin
          if client.is_list_member?(user, "team", list_member.id)
            logger.debug "Skipping #{list_member.name} (id: #{list_member.id})"
            next
          end
          logger.debug "Adding #{list_member.name} (id: #{list_member.id})"
          client.list_add_member(user, "team", list_member.id)
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
