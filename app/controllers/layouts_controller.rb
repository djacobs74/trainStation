class LayoutsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    
    def index
        @layouts = Layout.all
    end

    def new
        @layout = Layout.new
    end

    def create
        current_user.layouts.create(layout_params)
        redirect_to root_path
    end

    def show
        @layout = Layout.find(params[:id])
    end

    private

    def layout_params
        params.require(:layout).permit(:name, :description)
    end
end
