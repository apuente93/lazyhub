class ArticlesController < ApplicationController
  before_action :signed_in_user, only: [:upvote, :downvote, :new, :create, :update, :destroy]
  before_action :admin_user,     only: [:destroy, :edit]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.paginate(page: params[:page], :per_page => 20)
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

    @article.upvote_from current_user
    @article.save

    respond_to do |format|
      format.html {redirect_to :back}
      format.json { render json: @article }
      format.js
    end
  end

  def downvote
    @article = Article.find(params[:id])

    @article.downvote_from current_user
    @article.save
    
    respond_to do |format|
      format.html {redirect_to :back}
      format.json { render json: @article }
      format.js
    end
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
    @article.user_id = current_user.id

    respond_to do |format|
      if @article.save
        @article.views = 0
        if @article.image_tag == 'CNN'
          @article.image_tag = "http://res.cloudinary.com/www-lazyhub-com/image/upload/v1424383479/cnn_logo_psiwce.jpg"
        elsif @article.image_tag == 'reddit'
          @article.image_tag = "http://famouslogos.net/images/reddit-logo.jpg"
        elsif @article.image_tag == 'Ebaumsworld'
          @article.image_tag = "http://cdn.ebaumsworld.com/mediaFiles/picture/366483/82271662.jpg"
        elsif @article.image_tag == 'ESPN'
          @article.image_tag = "http://res.cloudinary.com/www-lazyhub-com/image/upload/v1424383479/espn_logo_cuaiiw.jpg"
        elsif @article.image_tag == 'GOAL'
          @article.image_tag = "http://static.goal.com/280900/280936_heroa.jpg"
        elsif @article.image_tag == '9gag'
          a = @article.content.partition('gag/').last.partition('?').first
          @article.image_tag = "http://img-9gag-ftw.9cache.com/photo/#{a}_460s.jpg"
        elsif @article.image_tag == 'Collegehumor'
          @article.image_tag = "http://www.technobuffalo.com/wp-content/uploads/2012/03/College-Humor-logo-640x359.jpg"
        elsif @article.image_tag == 'AddictingGames'
          @article.image_tag = "http://img2.wikia.nocookie.net/__cb20131228011010/logopedia/images/c/c2/Addicting_Games_974.jpg"
        elsif @article.image_tag == 'Miniclip'
          @article.image_tag = "http://www.lilireviews.com/wp-content/uploads/2013/08/Miniclip01-Logo1.jpg"
        elsif @article.image_tag == 'Cnet'
          @article.image_tag = "https://rimblogs.files.wordpress.com/2014/12/cnet-500x237.jpg"
        elsif @article.image_tag == 'PCmag'
          @article.image_tag = "http://www.getqardio.com/wp-content/uploads/2014/12/PCMag2.png"
        elsif @article.image_tag == 'Buzzfeed'
          @article.image_tag = "http://s3-ak.buzzfed.com/static/images/global/buzzfeed.jpg?v=201502061701"
        elsif @article.image_tag == 'EntertainmentWeekly'
          @article.image_tag = "http://www.majorcineplex.com/uploads/content/images/entertainment-weekly-logo.jpg"
        elsif @article.image_tag == 'digg'
          @article.image_tag = "http://img2.wikia.nocookie.net/__cb20121224123923/logopedia/images/3/32/Digg_Logo.png"
        elsif @article.image_tag == 'YouTube'
          @article.image_tag = "https://i.ytimg.com/vi/NlVpLOb_7c0/maxresdefault.jpg"
        elsif @article.image_tag == 'BBC News'
          @article.image_tag = "http://www.bbc.co.uk/news/special/2015/newsspec_10857/bbc_news_logo.png?cb=1"
        else
        end
        @article.save

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
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:upvote, :downvote, :content, :views, :article_type, :title, :image_tag, :user)
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
