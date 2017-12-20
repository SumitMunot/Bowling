require 'rails_helper'

RSpec.describe User, :type => :model do

  it "is valid with valid attributes" do
  	expect(User.new(:name => "Niharika")).to be_valid
  end

  it "is not valid without player name" do
  	user = User.new()
    expect(user).to_not be_valid
  end

  it "is not valid with name nil/blank" do
     user = User.new(:name => nil)
    expect(user).to_not be_valid
  end 
end
