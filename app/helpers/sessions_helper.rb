module SessionsHelper
  FIRST_YEAR = 13

  def lists
    list_owner = 'tcampdc'
    lists = []
    lists << 'attendees'
    lists << "TCamp14-attendees"
    lists << "TCamp13-attendees"
    lists.collect do |list|
      [[list_owner, list].join('/')]
    end
  end
end


 # lists << "TCamp14 Attendees"
 #    lists << "TCamp13 Attendees"