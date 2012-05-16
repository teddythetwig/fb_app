require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  test "friendship needs a user" do
    friendship = Friendship.new
    friendship.user = nil
    friendship.friend = users(:friend)
    assert !friendship.save, "saved without user"
  end
 
  test "friendship needs a friend" do
    friendship = Friendship.new
    friendship.user = users(:user)
    friendship.friend = nil
    assert !friendship.save, "saved without friend"
  end
  
  test "friendship succeeds with both" do
    friendship = Friendship.new
    friendship.user = users(:user)
    friendship.friend = users(:friend)
    assert friendship.save, "saved"
  end
end
