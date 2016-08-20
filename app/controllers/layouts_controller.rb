class LayoutsController < ApplicationController
    def index
        @layouts = Layout.all
    end

    def new
        @layout = Layout.new
    end
end
