module SessionsHelper
  FIRST_YEAR = 2011

  def lists
    list_owner = 'codeforamerica'
    lists = []
    lists << 'team'
    (FIRST_YEAR..Time.zone.now.year).each do |year|
      lists << "fellows-#{year}"
    end
    lists << 'staff'
    lists.collect do |list|
      [[list_owner, list].join('/')]
    end
  end
end
