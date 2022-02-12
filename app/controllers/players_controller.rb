class PlayersController < ApplicationController
  before_action :set_player, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :user_can_view_player, only: :show
  # GET /players or /players.json
  def index
    
     @players = Player.where(:user_id => current_user.id)
    # @players = Player.where(:user_id =>current_user=1)
    # @players = current_user.players
   
  end

  # GET /players/1 or /players/1.json
  def show
  end

  # GET /players/new
  def new
    # @player = Player.new
    @player = current_user.players.build
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players or /players.json
  def create
    # @player = Player.new(player_params)
    @player = current_user.players.build(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to player_url(@player), notice: "Player was successfully created." }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1 or /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to player_url(@player), notice: "Player was successfully updated." }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1 or /players/1.json
  def destroy
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url, notice: "Player was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @player = current_user.players.find_by(id: params[:id])
    redirect_to players_path, notice: "You are not authorized to edit this player." if @player.nil?
  end
  def user_can_view_player
    @player = Player.find(params[:id])
    unless @player.user_id == current_user.id
      flash[:notice] = "You may only view Tasks you have created."
      redirect_to(players_path)
    end 
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def player_params
      params.require(:player).permit(:name, :email, :city, :state, :country, :phone, :image, :gender, :sport_id,:user_id)
    end
end
