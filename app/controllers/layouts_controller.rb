class LayoutsController < ApplicationController
    def index
        @layouts = Layout.all
    end
end
