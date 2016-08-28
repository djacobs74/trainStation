class PhotosController < ApplicationController
    before_action :authenticate_user!
    def create
        @layout = Layout.find(params[:layout_id])
        @layout.photos.create(photo_params.merge(user: current_user))
        redirect_to layout_path(@layout)
    end

    private

    def photo_params
        params.require(:photo).permit(:picture)
    end
end
