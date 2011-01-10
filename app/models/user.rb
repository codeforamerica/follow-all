class User
  attr_reader :id, :friends_count

  def initialize(user={})
    @id = user[:id]
    @friends_count = user[:friends_count]
  end
end
