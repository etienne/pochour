# encoding: UTF-8

class EpithetsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    # requested_epithet = params[:epithet]
    # if @epithet = Epithet.find_by_name(requested_epithet)
    # else
    # end
    @epithet = @article.epithets.create(params[:epithet])
    redirect_to user_article_path(@article.user, @article), :notice => 'Vous êtes la première personne à utiliser cet épithète.'
  end
end
