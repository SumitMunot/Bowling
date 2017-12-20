class AddPlayersToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :players, :integer
  end
end
