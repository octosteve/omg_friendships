class User < ActiveRecord::Base
  has_many :friendships

  def friends
    # Find all friendships where you are either the initiator or the requested friend
    fs =  Friendship.where('user_id = :user_id OR friend_id = :user_id', user_id: self.id)
    # get all of the ids, remove the user's id from the list since they'd be include
    ids = fs.pluck(:user_id, :friend_id).flatten - Array(self.id)
    # Find the users with that id.
    User.where(id: ids)
  end

  def add_friend(friend)
    # Add a friendship with the user_id set to the user's id
    friendships.create(friend_id: friend.id)
  end
end
