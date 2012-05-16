class User < ActiveRecord::Base
  has_many :friendships, :dependent => :destroy
  has_many :friends, :through => :friendships
  
  attr_accessible :token, :uid, :token, :name
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.token = auth["credentials"]["token"]
      me = FbGraph::User.me(user.token)
      friends = me.friends
      user.find_and_create_friendships(friends)
    end
  end
  
  def find_and_create_friendships(friends)
    friends.each do |f|
      if friend = User.find_by_uid(f.identifier)
        create! do |friendship|
          friendship.user = self
          friendship.friend = friend
        end
      end
    end    
  end
  
  
end
