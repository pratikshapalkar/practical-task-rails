class AchievementsController < ApplicationController
  before_action :set_achievement, only: %i[ show edit update destroy ]

  # GET /achievements or /achievements.json
  def index
    @achievements = Achievement.all
  end

  # GET /achievements/1 or /achievements/1.json
  def show
  end

  # GET /achievements/new
  def new
    @achievement = Achievement.new
  end

  # GET /achievements/1/edit
  def edit
  end

  # POST /achievements or /achievements.json
  def create
    @achievement = Achievement.new(achievement_params)

    respond_to do |format|
      if @achievement.save
        format.html { redirect_to achievement_url(@achievement), notice: "Achievement was successfully created." }
        format.json { render :show, status: :created, location: @achievement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /achievements/1 or /achievements/1.json
  def update
    respond_to do |format|
      if @achievement.update(achievement_params)
        format.html { redirect_to achievement_url(@achievement), notice: "Achievement was successfully updated." }
        format.json { render :show, status: :ok, location: @achievement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /achievements/1 or /achievements/1.json
  def destroy
    @achievement.destroy

    respond_to do |format|
      format.html { redirect_to achievements_url, notice: "Achievement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achievement
      @achievement = Achievement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def achievement_params
      params.require(:achievement).permit(:award, :gold_medal, :silver_medal, :bronze_medal, :status, :player_id, :player_name)
    end
end
