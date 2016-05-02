class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.user_name = current_user.username
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @article, notice: "Comment was successfully created"}
        format.json { render json: @comment, status: :created, location: @comment}
      else
        format.html { render 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def comment_params
    @user = current_user.id
    params.require(:comment).permit(:body)
  end
end
