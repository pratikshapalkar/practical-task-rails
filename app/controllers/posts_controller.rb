class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_sport
  before_action :set_post, only: %i[ show edit update destroy ]
  # before_action :correct_user, only: [:edit, :update, :destroy]
  # before_action :user_can_view_player, only: :show
  # GET /posts or /posts.json
  def index
    @posts = @sport.posts
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post_attachments = @post.post_attachments.all
  end

  # GET /posts/new
  def new
    @post = @sport.posts.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = @sport.posts.new(post_params)
    # @post = @sport.posts.create(params[:post].permit(:title, :description, :user_id, :sport_id, post_attachments_attributes:[:id, :post_id, :avatar]))

    respond_to do |format|
       if @post.save
     
        format.html { redirect_to sport_post_path(@sport, @post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to sport_post_path(@sport, @post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to sport_posts_path(@sport), notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to posts_path, notice: "You are not authorized to edit this player." if @post.nil?
  end
  
  def post_dataset
    render json: { data: @posts }
  end
  private
  #getting object for nested routing
  def get_sport
    @sport = Sport.find(params[:sport_id])
  end
  
  # Use callbacks to share common setup or constraints between actions.
  def set_post
      @post = @sport.posts.find(params[:id])
  end
  # Only allow a list of trusted parameters through.
  def post_params
      params.require(:post).permit(:title, :description, :user_id, :sport_id, post_attachments_attributes: 
        [:id, :post_id, :avatar])
  end
  
  
end