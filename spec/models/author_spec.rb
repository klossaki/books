require 'spec_helper'

describe Author do
  let(:author) { FactoryGirl.create(:author)}
  
  it "create a new author" do
    author.name.should == "Albert McKeever"
  end
end
