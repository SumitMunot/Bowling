json.extract! game, :id, :score_board, :winner, :players, :created_at, :updated_at
json.url game_url(game, format: :json)
