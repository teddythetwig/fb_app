require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :all
  test "user should not save without name" do
    user = User.new
    user.name = nil
    user.uid = "4"
    user.provider = "facebook"
    user.token = "lsdkjflskdjfldkjf"
    assert !user.save, "Saved without name"
  end
  test "user should not save without uid" do
    user = User.new
    user.name = "Kristin"
    user.uid = nil
    user.provider = "facebook"
    user.token = "lsdkjflskdjfldkjf"
    assert !user.save, "Saved without uid"
  end
  test "user should not save without provider" do
    user = User.new
    user.name = "Kristin"
    user.uid = "4"
    user.provider = nil
    user.token = "lsdkjflskdjfldkjf"
    assert !user.save, "Saved without provider"
  end
  test "user should not save without token" do
    user = User.new
    user.name = "Kristin"
    user.uid = "4"
    user.provider = "facebook"
    user.token = nil
    assert !user.save, "Saved without token"
  end
  test "user should save" do
    user = User.new
    user.name = "Kristin"
    user.uid = "4"
    user.provider = "facebook"
    user.token = "lsdkjflskdjfldkjf"
    assert user.save, "Did not save"
  end
  test "user.friends method should return 1" do
    f_len = users(:user).friends.length
    assert  f_len == 1, "but was #{f_len}"
  end
  
  test "friend.friends method should return 1" do
    f_len = users(:friend).friends.length
    assert  f_len == 1, "but was #{f_len}"
  end
  
  test "find_and_create_friendships should not add friend with empty array" do
    friends = []
    before = Friendship.all.length
    users(:user).find_and_create_friendships(friends)
    assert_equal Friendship.all.length, before, "A friendship was created"
  end
  
  test "find_and_create_friendships should add friend" do
    friends = [users(:other)]
    before = Friendship.all.length
    users(:user).find_and_create_friendships(friends)
    after = Friendship.all.length
    assert_not_equal before, after, "#{friends}"
  end
  
end
