class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy, :edit, :update]

  def index
    @articles = Article.all
  end

  def show
    # @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.create(article_params)

    redirect_to "/articles/#{article.id}"
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def update
    # @article = Article.find(params[:id])
    @article.update(article_params)

    flash[:notice] = "Article '#{@article.title}' Updated!"

    redirect_to "/articles/#{@article.id}"
  end

  def destroy
    # Article.destroy(params[:id])
    @article.destroy

    redirect_to '/articles'
  end

  private

    def article_params
      params.permit(:title, :body)
    end

    def set_article
      @article = Article.find(params[:id])
    end

end
