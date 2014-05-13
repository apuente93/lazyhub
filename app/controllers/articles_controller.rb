class ArticlesController < ApplicationController
  before_action :signed_in_user, only: [:points, :downvote, :new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @article.increment!(:views)
    @article.content
  end

  def views
    @article = Article.find(params[:id])
    @article.increment!(:views)
    redirect_to @article.content
  end

  def points
    @article = Article.find(params[:id])
    @article.increment!(:upvote)  
    redirect_to :back
  end

  def downvote
    @article = Article.find(params[:id])
    @article.decrement!(:upvote)
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
        @article.upvote = 0;
        @article.downvote = 0;
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
    respond_to do |format|
      if @article.update(article_params)
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
    @article.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
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
      params.require(:article).permit(:upvote, :downvote, :content, :views, :article_type, :article_type_id)
    end

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :upvoted, :downvoted)
    end
end
