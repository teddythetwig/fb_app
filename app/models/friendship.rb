class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"
  validates_presence_of :user,:friend
  
  def self.find_by_user_or_friend(user_or_friend)
    if(user_or_friend != nil)
      find :all, :conditions => ['friend_id = ? or user_id = ?', user_or_friend.id, user_or_friend.id]
    end
  end
end
