class Game < ApplicationRecord
  serialize :score_board
  serialize :winner
  serialize :user

  has_many :casings

  validates :players , :numericality => { :only_integer => true, :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1}, :presence => true
  validates_presence_of :players

  # initialises the score board and turn value
  def init
    self.score_board = {}
    self.winner = {}
    self.game_turn = 1
  end

  # Adds users to game
  def add_users(users_list=[])
    self.init()
    users_list.each do |user|
      self.score_board[user.to_i] = 0
    end
    self.players = users_list.size
  end

end
