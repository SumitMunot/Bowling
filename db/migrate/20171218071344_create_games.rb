class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.text :score_board
      t.text :winner

      t.timestamps
    end
  end
end
