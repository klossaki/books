require 'spec_helper'

describe User do
  let!(:user) { FactoryGirl.create(:user) }

  context "create user" do
    it "should return the correct email" do
      user.email.should == 'guest2@scholastic.com'
    end
  end
end
