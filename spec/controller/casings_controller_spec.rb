require "rails_helper"

RSpec.describe CasingsController, :type => :controller do
  before(:each) do
    @user =  User.create(:name => "Niharika")
    @game = Game.create(:game_turn => 1, :players => 1)
    @game.score_board ={ 1 => 0}
    @game.winner = {}
    @game.save
  end
  describe "GET index" do
    it "has a 200 status code" do
      get(:index, params: { game_id: 1 })
      expect(response.status).to eq(200)
    end
  end

  describe "responds to" do
    it "responds to html by default" do
      post :create, :params => { :casing => {:try1 => 1, :try2 => 2, :turn => 1, :user_id => @user.id, :game_id => @game.id},:game_id => @game.id }
      expect(response.content_type).to eq "text/html"
    end
  end
end
