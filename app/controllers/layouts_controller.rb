class LayoutsController < ApplicationController
    def index
        @layouts = Layout.all
    end

    def new
        @layout = Layout.new
    end

    def create
        Layout.create(layout_params)
        redirect_to root_path
    end

    private

    def place_params
        params.require(:layout).permit(:name, :description)
    end
end
