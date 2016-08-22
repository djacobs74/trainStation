class LayoutsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    
    def index
        @layouts = Layout.all
    end

    def new
        @layout = Layout.new
    end

    def create
        @layout = current_user.layouts.create(layout_params)
        if @layout.valid?
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @layout = Layout.find(params[:id])
        @comment = Comment.new
    end

    def edit
        @layout = Layout.find(params[:id])

        if @layout.user != current_user
            return render text: 'Not Allowed', status: :forbidden
        end
    end

    def update
        @layout = Layout.find(params[:id])
        if @layout.user != current_user
            return render text: 'Not Allowed', status: :forbidden
        end

        @layout.update_attributes(layout_params)
        if @layout.valid?
            redirect_to root_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @layout = Layout.find(params[:id])
        if @layout.user != current_user
            return render text: 'Not Allowed', status: :forbidden
        end

        @layout.destroy
        redirect_to root_path
    end

    private

    def layout_params
        params.require(:layout).permit(:name, :description)
    end
end
