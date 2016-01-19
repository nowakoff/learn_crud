class CommentsController < ApplicationController
  # def index
  #   @comments = comment.all
  # end

  # def new
  #   @comment = comment.new()
  # end

  # def show
  #   @comment = comment.find(params[:id])
  # end

  # def edit
  #   @comment = Comment.find(params[:id])
  # end

  def create
    @article = Article.find(2)
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  # def update
  #   @comment = Comment.find(params[:id])
  #   if @comment.update(comment_params)
  #     redirect_to @comment
  #   else
  #     @errors = @comment.errors.full_messages
  #     render 'new'
  #   end
  # end

  # def destroy
  #   @comment = comment.find(params[:id])
  #   @comment.destroy
  #   redirect_to comments_path
  # end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
