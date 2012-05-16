require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  fixtures :all
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
  
  test "find_by_user_or_friend for nil should be nil" do
    friends = Friendship.find_by_user_or_friend(nil)
    assert friends == nil, "Was #{friends}"
  end
  
  test "find_by_user_or_friend for user should be 1 for users(:user)" do
    friends = Friendship.find_by_user_or_friend(users(:user))
    assert friends.length == 1, "Length was #{friends.length}"
  end
  
  test "find_by_user_or_friend for user should be 1 for users(:friend)" do
    friends = Friendship.find_by_user_or_friend(users(:friend))
    assert friends.length == 1, "Length was #{friends.length}"
  end
  
  test "find_by_user_or_friend for user should be 0 for users(:other)" do
    friends = Friendship.find_by_user_or_friend(users(:other))
    assert friends.length == 0, "Length was #{friends.length}"
  end
end
