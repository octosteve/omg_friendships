require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "friendships work" do
    users(:steven).add_friend users(:bob)
    assert users(:steven).friends.include?(users(:bob)), "Doesn't include Bob"
    assert users(:bob).friends.include?(users(:steven)), "Doesn't include Steven"
  end
end
