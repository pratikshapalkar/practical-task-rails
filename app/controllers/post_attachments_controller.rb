class PostAttachmentsController < ApplicationController
  before_action :set_post_attachment, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /post_attachments or /post_attachments.json
  def index
    @post_attachments = PostAttachment.all
  end

  # GET /post_attachments/1 or /post_attachments/1.json
  def show
  end

  # GET /post_attachments/new
  def new
    @post_attachment = PostAttachment.new
  end

  # GET /post_attachments/1/edit
  def edit
  end

  # POST /post_attachments or /post_attachments.json
  def create
    @post_attachment = PostAttachment.new(post_attachment_params)

    respond_to do |format|
      if @post_attachment.save
        format.html { redirect_to post_attachment_url(@post_attachment), notice: "Post attachment was successfully created." }
        format.json { render :show, status: :created, location: @post_attachment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_attachments/1 or /post_attachments/1.json
  def update
    respond_to do |format|
      if @post_attachment.update(post_attachment_params)
        format.html { redirect_to post_attachment_url(@post_attachment), notice: "Post attachment was successfully updated." }
        format.json { render :show, status: :ok, location: @post_attachment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_attachments/1 or /post_attachments/1.json
  def destroy
    @post_attachment.destroy

    respond_to do |format|
      format.html { redirect_to post_attachments_url, notice: "Post attachment was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def user_can_view_post
    @post_attachment = PostAttachment.find(params[:id])
    unless @post_attachment.user_id == current_user.id
      flash[:notice] = "You may only view Tasks you have created."
      redirect_to(post_attachments_path)
    end 
 end

 def correct_user
 
  @post_attachment = current_user.posts.find_by(id: params[:id])
  redirect_to post_attachments_path, notice: "You are not authorized to edit this player." if @post_attachments.nil?

end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_attachment
      @post_attachment = PostAttachment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_attachment_params
      params.require(:post_attachment).permit(:avatar, :post_id, :user_id)
    end
end

