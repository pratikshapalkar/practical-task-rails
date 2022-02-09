class Comments::TagsController < TagsController
    before_action :set_tagable

    def create
        super
    end
    private 

    def set_tagable
        @tagable= Comment.find(params[:comment_id])
    end
end