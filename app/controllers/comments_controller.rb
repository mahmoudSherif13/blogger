class CommentsController < ApplicationController
    include CommentsHelper
    before_action :require_login, except: [:create]
    
    def create
        @comment = Comment.new(comment_params())
        @comment.article_id = params[:article_id]
        @comment.author = current_user
        @comment.save()
        redirect_to article_path(@comment.article)
    end

    def up_vote
        @comment = Comment.find(params[:comment_id])
        @comment.up_votes += 1
        @comment.save()
        redirect_to article_path(@comment.article)
    end
    
    def down_vote
        @comment = Comment.find(params[:comment_id])
        @comment.down_votes += 1
        @comment.save()
        redirect_to article_path(@comment.article)
    end

end
