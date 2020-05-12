class TagsController < ApplicationController
    before_action :require_login, only: [:destory]
    def show
        @tag = Tag.find(params[:id])
    end
    
    def index
        @tags = Tag.all
    end
end
