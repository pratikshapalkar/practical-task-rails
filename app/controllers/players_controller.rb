class PlayersController < ApplicationController
  before_action :get_sport
  before_action :set_player, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :correct_user, only: [:edit, :update, :destroy]
  # before_action :user_can_view_player, only: :show
  # GET /players or /players.json
  def index
    @players = @sport.players
    #  @players = @sport.players.where(:user_id => current_user.id)
    # @players = Player.where(:user_id =>current_user=1)
    # @players = current_user.players
  end

  # GET /players/1 or /players/1.json
  def show
  end

  # GET /players/new
  def new
    # @player = Player.new
    @player = @sport.players.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players or /players.json
  def create
    # @player = Player.new(player_params)
    # @player = current_user.players.build(player_params)
    Player.transaction do
    begin
    @player = @sport.players.new(player_params)
    respond_to do |format|
      if @player.save 
        
        format.js
        format.html { redirect_to sport_player_path(@sport, @player), notice: "Player was successfully created." }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    rescue StandardError
      raise ActiveRecord::Rollback
        redirect_to sport_path(@sport), notice: "Player is empty" if @player.nil?
      end
      end
      end
    end
  end


  # PATCH/PUT /players/1 or /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to sport_player_path(@sport, @player), notice: "Player was successfully updated." }
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
      format.html { redirect_to sport_player_path(@sport) }
      format.json { head :no_content }
      format.js   { render :layout => false }
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
  def get_sport
    
    @sport = Sport.find(params[:sport_id])
   
    # raise ActiveRecord::Rollback
    # redirect_to sports_path, notice: "You are fetching the records that are not exists in database."
    end
    
  
    # Use callbacks to share common setup or constraints between actions.
    def set_player
        @player = @sport.players.find(params[:id])   
    end
  
    # Only allow a list of trusted parameters through.
    def player_params
      params.require(:player).permit(:name, :email, :city, :state, :country, :phone, :image, :gender, :sport_id,:user_id,:tag_list)
    end