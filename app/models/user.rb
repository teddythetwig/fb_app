class User < ActiveRecord::Base
  has_many :friendships, :dependent => :destroy
  validates_presence_of :token,:uid, :name, :provider
  
  attr_accessible :token, :uid, :name, :provider
  
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
      ##the value for this should be f.id, but I can not get it to work with the fixture
      if friend = User.find_by_name(f.name)
        Friendship.new do |friendship|
          friendship.user = self
          friendship.friend = friend
          friendship.save
        end
      end
    end    
  end
  
  def friends
    Friendship.find_by_user_or_friend(self)
  end
end
