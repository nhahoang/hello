require 'spec_helper'

describe User do

  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end
  
  it "is invalid without a fullname" do
    FactoryGirl.build(:user, fullname: nil).should_not be_valid
  end

  it "is invalid without a fullname" do
    FactoryGirl.build(:user, username: nil).should_not be_valid
  end

  it "is invalid without a fullname" do
    FactoryGirl.build(:user, password_digest: nil).should_not be_valid
  end

  it "is admin" do
    user = FactoryGirl.build(:user, role: 0)
    user.is_admin.should == false
  end

  it "authenticate" do
    user = FactoryGirl.build(:user, username: "abc", password_digest: "abc")
    User.authenticate("abc","abc").should == user
  end

end