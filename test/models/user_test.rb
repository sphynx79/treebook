require 'test_helper'

class UserTest < ActiveSupport::TestCase
   test "a user should enter a first name" do
      user = users(:one)
      assert !user.save
      assert !user.errors[:first_name].empty?
   end

   test "a user should enter a last name" do
      user = users(:two)
      assert !user.save
      assert !user.errors[:last_name].empty?
   end

   test "a user should enter a profile name" do
      user = users(:three)
      assert !user.save
      assert !user.errors[:profile_name].empty?
   end

   test "a user should have a unique profile name" do
      user = users(:four)
      assert !user.save
      assert !user.errors[:profile_name].empty?
   end

   test "a user should have a profile name without spaces" do
      user = users(:five)
      assert !user.save
      assert !user.errors[:profile_name].empty?
      assert user.errors[:profile_name].include?("must be formatted correctly")
   end

   test "a user can have a correctly formatted profile name" do
      user = users(:six)
      assert user.valid?
   end

end
