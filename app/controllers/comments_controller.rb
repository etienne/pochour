class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    comment = params[:comment]
    if user_signed_in? and current_user.name == comment[:author]
      comment[:user] = current_user
      comment[:author] = nil
    end
    @comment = @article.comments.create(comment)
    redirect_to @article
  end
end
