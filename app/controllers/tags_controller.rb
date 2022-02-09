class TagsController < ApplicationController
    def new
        @tag = @tagable.tags.new
     end
   
     def create
          @tag = @tagable.tags.new tags_params
          @tagable.save
          redirect_to @tagable, notice: "Your note was successfully posted"
     end
   
       private
         
          def tags_params
            params.require(:tag).permit(:content)
          end
end
