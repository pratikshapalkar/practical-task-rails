class SportsController < ApplicationController
  before_action :set_sport, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [ :show, :index ]
  # before_action :authorize_admin, except: [:index, :create, :edit]

  # GET /sports or /sports.json
  def index
    # TweetJob.set(wait: 15.seconds).perform_later
    @sports = Sport.all
  end

  # GET /sports/1 or /sports/1.json
  def show
    # sport = Sport.all
    # WelcomeMailJob.perform_async(sport.first.name,sport.first.no_of_players)
  end

  # GET /sports/new
  def new
    @sport = Sport.new
  end

  # GET /sports/1/edit
  def edit
  end

  # POST /sports or /sports.json
  def create
    @sport = Sport.new(sport_params)

    respond_to do |format|
      if @sport.save
        format.html { redirect_to sport_url(@sport), notice: "Sport was successfully created." }
        format.json { render :show, status: :created, location: @sport }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sports/1 or /sports/1.json
  def update
    respond_to do |format|
      if @sport.update(sport_params)
        format.html { redirect_to sport_url(@sport), notice: "Sport was successfully updated." }
        format.json { render :show, status: :ok, location: @sport }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sports/1 or /sports/1.json
  def destroy
    @sport.destroy

    respond_to do |format|
      format.html { redirect_to sports_url, notice: "Sport was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def sport_dataset
    render json: { sports: Sport.page(params[:page]).per(per_page)}
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sport
      @sport = Sport.find(params[:id])
    rescue ActiveRecord::RecordNotFound => error
      redirect_to sports_path, notice: "You are fetching the records that are not exists in database."
    end

    # Only allow a list of trusted parameters through.
    def sport_params
      params.permit(:name ,:no_of_players)
    end
end
