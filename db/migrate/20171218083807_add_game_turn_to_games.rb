class AddGameTurnToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :game_turn, :integer
  end
end
