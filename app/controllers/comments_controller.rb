class CommentsController < ApplicationController
  before_action :get_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments or /comments.json
  def index
    @comments = @post.comments
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = @post.comments.build
    # @comment = @post.comments.build(comment_params)
    # @comment = Comment.new(comment_params)
    
    # @comment.post_id = params[:post_id]
    
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create   
    @comment = @post.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to sport_posts_path(@sport, @post), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_comment_path(@post), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to sport_posts_path(@sport, @post), notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  private
  

   #to get post object #nested route
  def get_sport
    @sport = Sport.find(params[:sport_id]) 
  end
  def get_post
    @post = Post.find(params[:post_id])
  end
  
    # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = @post.comments.find(params[:id])
  end

    
    
    # Only allow a list of trusted parameters through.
  def comment_params
      params.require(:comment).permit(:comment_no, :user_comment,:sport_id,:post_id, :user_id)
  end
end
