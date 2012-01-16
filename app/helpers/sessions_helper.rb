module SessionsHelper

  FIRST_YEAR = 2011

  def lists
    list_owner = "codeforamerica"
    lists = []
    lists << "team"
    (FIRST_YEAR..Date.today.year).each do |year|
      lists << "fellows-#{year}"
    end
    lists << "staff"
    lists.map do |list|
      [[list_owner, list].join('/')]
    end
  end

end
