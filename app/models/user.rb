class User < ActiveRecord::Base
  has_many :friendships, :dependant => :destroy
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.token = auth["credentials"]["token"]
    end
    me = FbGraph::User.fetch("me", :access_token => self.token)
    friends = me.friends
    user.find_and_create_friendships(friends)
  end
  
  def find_and_create_friendships(friends)
    friends.each do |f|
      if friend = User.find_by_uid(f.id)
        create! do |friendship|
          friendship.user = self
          friendship.friend = friend
        end
      end
    end    
  end
  
  
end
