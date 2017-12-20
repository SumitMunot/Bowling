require 'rails_helper'

RSpec.describe Game, :type => :model do

  it "is valid with valid attributes" do
  	expect(Game.new(:players => 1)).to be_valid
  end

  it "is not valid without a player" do
  	game = Game.new()
    expect(game).to_not be_valid
  end

  it "is not valid with players nil/blank" do
     game = Game.new(:players => nil)
    expect(game).to_not be_valid
  end 
end
