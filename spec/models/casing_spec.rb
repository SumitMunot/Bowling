require 'rails_helper'

RSpec.describe Casing, :type => :model do

	before(:each) do
    @user = User.create(:name => "Niharika")
    @user1 = User.create(:name => "Akhil")
    @game = Game.create(:game_turn => 1, :players => 1)
    @game.score_board ={ 1 => 0}
    @game.winner = {}
    @game.save
    @game1 = Game.create(:game_turn => 1, :players => 2)
    @game1.score_board ={ 1=> 0, 2 => 0}
    @game1.winner = {}
    @game1.save

  end
  it "is valid with valid attributes" do
  	expect(Casing.new(:user_id => @user.id, :game_id => @game.id,:try1 => 1, :try2 => 2, :turn =>  1)).to be_valid
  end
  it "is not valid without a turn" do
  	casing = Casing.new(:turn => nil,:user_id => @user.id, :game_id => @game.id,:try1 => 1, :try2 => 2)
    expect(casing).to_not be_valid

  end
  it "is not valid without try 1" do
     casing = Casing.new(:turn => 1,:user_id => @user.id, :game_id => @game.id,:try1 => nil, :try2 => 2)
    expect(casing).to_not be_valid
  end
  it "is not valid without try 2" do
  	casing = Casing.new(:turn => 1,:user_id => @user.id, :game_id => @game.id,:try1 => 1, :try2 => nil)
    expect(casing).to_not be_valid
  end
  it "is not valid without a game" do
  	casing = Casing.new(:turn => 1,:user_id => @user.id, :game_id => nil ,:try1 => 1, :try2 => 2)
    expect(casing).to_not be_valid
  end
  it "is not valid without a user" do
  	casing = Casing.new(:turn => 1,:user_id => nil, :game_id => @game.id,:try1 => 1, :try2 => 2)
    expect(casing).to_not be_valid
  end
  
  it "is a strike" do
  	casing = Casing.new(:turn => 1,:user_id => @user.id, :game_id => @game.id,:try1 => 10, :try2 => 0)
  	casing.save
    expect(casing.status).to eq("strike")
  end

  it "is a spare" do
  	casing = Casing.new(:turn => 1,:user_id => @user.id, :game_id => @game.id,:try1 => 4, :try2 => 6)
  	casing.save
    expect(casing.status).to eq("spare")
  end

  it "is a none (non strike non spare" do
  	casing = Casing.new(:turn => 1,:user_id => @user.id, :game_id => @game.id,:try1 => 2, :try2 => 0)
  	casing.save
    expect(casing.status).to eq("none")
  end

  it "is updating the game scorebord" do
  	casing = Casing.new(:turn => 1,:user_id => @user.id, :game_id => @game.id,:try1 => 2, :try2 => 0)
  	casing.save
    expect(casing.game.score_board[@user.id]).to eq(2)
  end

  it "is updating the winner" do
  	casing = Casing.new(:turn => 1,:user_id => @user.id, :game_id => @game.id,:try1 => 2, :try2 => 0)
  	casing.save
    expect(casing.game.winner[@user.id]).to eq(2)
  end

  it "updates winner correctly for multiple players" do
  	casing1 = Casing.new(:turn => 1,:user_id => @user.id, :game_id => @game1.id,:try1 => 2, :try2 => 1)
  	casing1.save

  	casing2 = Casing.new(:turn => 1,:user_id => @user1.id, :game_id => @game1.id,:try1 => 2, :try2 => 6)
  	casing2.save

  	expect(casing2.game.winner[@user1.id]).to eq(8)
  end
end