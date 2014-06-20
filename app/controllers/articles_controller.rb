class ArticlesController < ApplicationController
  before_action :signed_in_user, only: [:upvote, :downvote, :new, :create, :update, :destroy]
  before_action :admin_user,     only: [:destroy, :edit]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.paginate(page: params[:page])
    if signed_in?
      @comment  = current_user.comments.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def views
    @article = Article.find(params[:id])
    @article.increment!(:views)
    redirect_to @article.content
  end

  def upvote
    @article = Article.find(params[:id])
    if (!current_user.voted_up_on? @article)
    @article.increment!(:upvote)
    end
    @article.liked_by current_user
    redirect_to :back
  end

  def downvote
    @article = Article.find(params[:id])
    if (!current_user.voted_down_on? @article)
    @article.decrement!(:upvote)
    end
    @article.downvote_from current_user
    redirect_to :back
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        if @article.article_type == 'Laugh'
          @article.article_type_id = 1
          @article.save
        end
        if @article.article_type == 'Game'
          @article.article_type_id = 2
          @article.save
        end
        if @article.article_type == 'News'
          @article.article_type_id = 3
          @article.save
        end
        if @article.article_type == 'Random'
          @article.article_type_id = 4
          @article.save
        end
        @article.views = 0;
        @article.save;

        format.html { redirect_to root_path, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @article }
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.update_attributes(article_params)
        if @article.article_type == 'Laugh'
          @article.article_type_id = 1
          @article.save
        end
        if @article.article_type == 'Game'
          @article.article_type_id = 2
          @article.save
        end
        if @article.article_type == 'News'
          @article.article_type_id = 3
          @article.save
        end
        if @article.article_type == 'Random'
          @article.article_type_id = 4
          @article.save
        end
        format.html { redirect_to root_path, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:upvote, :downvote, :content, :views, :article_type, :article_type_id, :title)
    end

    def user_params
      params.require(:user).permit(:username, :email, :password,
                                   :password_confirmation)
    end

    def admin_user
      if !signed_in?
        signed_in_user
      else
        redirect_to(root_url) unless current_user.admin?
      end
    end
end
