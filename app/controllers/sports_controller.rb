class SportsController < ApplicationController
  before_action :authenticate_user!, except: [ :show, :index ]
  before_action :set_sport, only: %i[ show edit update destroy ]

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
      format.js
      format.html { redirect_to sports_url }
      format.json { head :no_content }
   end
  end

  def sport_dataset
    sports = Sport.all
    search_string = []
    filter_query = ''

    ## Check if Search Keyword is Present & Write it's Query
    if params.has_key?('search') && params[:search].has_key?('value') && params[:search][:value].present?
      search_columns.each do |term|
        search_string << "#{term} ILIKE :search"
      end
      sports = sports.where(search_string.join(' OR '), search: "%#{params[:search][:value]}%")
    end

    sports = sports.order("#{sort_column} #{datatable_sort_direction}") unless sort_column.nil?
    sports = sports.page(datatable_page).per(datatable_per_page)

    render json: {
        sports: sports,
        draw: params['draw'].to_i,
        recordsTotal: sports.count,
        recordsFiltered: sports.total_count,
    }
  end
  private
  def search_columns
    %w(name)
  end

  ## Datatable Column List on which sorting can be performed
  def sort_column
    columns = %w(name)
    columns[params[:order]['0'][:column].to_i - 1]
  end

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
