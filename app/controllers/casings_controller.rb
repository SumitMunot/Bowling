class CasingsController < ApplicationController
  before_action :set_casing, only: [:show, :edit, :update, :destroy]

  # GET /casings
  # GET /casings.json
  def index
    @casings = Casing.all.where(:game_id => params[:game_id]).group_by(&:user_id)
    @game_id = params[:game_id]
    @game_turn = Game.find(@game_id).game_turn
  end

  # GET /casings/1
  # GET /casings/1.json
  def show
  end

  # GET /casings/new
  def new
    @casing = Casing.new
    @game_id = params[:game_id]
    @players = User.where(:id => Game.find(@game_id).score_board.keys)
  end

  # GET /casings/1/edit
  def edit
  end

  # POST /casings
  # POST /casings.json
  # requires game id for casings for that game
  def create
    @game_id = params[:game_id]
    @players = User.where(:id => Game.find(@game_id).score_board.keys)
    @casing = Casing.new(casing_params.merge!(game_id: @game_id))
    respond_to do |format|
      if @casing.save
        format.html { redirect_to game_casings_url, notice: 'Casing was successfully created.' }
        format.json { render :index, status: :created, location: @casing }
      else
        format.html { render :new }
        format.json { render json: @casing.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_casing
      @casing = Casing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def casing_params
      params.require(:casing).permit(:try1, :try2, :turn, :score, :user_id, :game_id)
    end
end
