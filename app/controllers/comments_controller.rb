class CommentsController < ApplicationController
    before_action :authenticate_user!
    def create
        @layout = Layout.find(params[:layout_id])
        @layout.comments.create(comment_params.merge(user: current_user))
        redirect_to layout_path(@layout)
    end

    private

    def comment_params
        params.require(:comment).permit(:message)
    end
end
