class CommentsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @article = Article.find(params[:article_id])
    @comment.article_id = @article.id
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to :back 
    else
      @feed_items = []
      redirect_to :back
    end
  end

  def destroy
    @comment.destroy
    redirect_to :back
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end