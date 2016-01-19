class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new()
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to action: "index"
      # can i redirect to articles_url
    else
      @errors = @article.errors.full_messages
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      @errors = @article.errors.full_messages
      render 'new'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
