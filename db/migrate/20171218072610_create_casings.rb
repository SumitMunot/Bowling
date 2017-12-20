class CreateCasings < ActiveRecord::Migration[5.1]
  def change
    create_table :casings do |t|
      t.integer :try1
      t.integer :try2
      t.integer :turn
      t.integer :score
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
