class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.where(:status => 1)
  end

  # GET /articles/1
  def show
    ts = @article.topics.asc(:_id) #.where(:status => 1) 
    contents = []
    ts.each do |item|
      item.posts.each do |post|
        contents << post.content
      end
    end
    @content = contents.join('<hr>')
 
#    topics = @article.topics.where(:status => 1, :page_num => 1)
  #    @content = "内容不存在！"
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:mytitle, :mydescription, :tags, :only_author, :published, :title, :author, :class_name, :first_time, :last_time, :from_name, :from_url, :last_url, :from_ip, :status, :pages_count, :words_count, :like_count, :hits)
    end
end
