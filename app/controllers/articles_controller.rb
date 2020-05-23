class ArticlesController < ApplicationController
    include ArticlesHelper
    before_action :require_login, except: [:show, :index]
    before_action :check_if_cur_author , only: [:edit, :update, :destroy]
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
        @comment = Comment.new
        @comment.article_id = @article.id
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.author = current_user
        @article.save
        flash.notice = "Article #{@article.title} created!"
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy()
        flash.notice = "Article #{@article.title} deleted!"
        redirect_to  articles_path()
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])    
        @article.update(article_params)
        flash.notice = "Article #{@article.title} updated!"
        redirect_to article_path(@article)
    end

    private
    def check_if_cur_author
        if(current_user.id != params[:id].to_i)
          flash[:error] = "you are not authorized to do this action"
          redirect_back(fallback_location: root_path)
          return false
        end
      end
end
