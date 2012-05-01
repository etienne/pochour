class ArticlesController < ApplicationController
  authorize_resource
  
  def new
    @article = Article.new
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def create
    @article = Article.new(params[:article])
    @article.user = current_user
    
    if @article.save
      redirect_to(user_article_path(@article.user, @article), :notice => 'Bravo.')
    else
      render :action => "new"
    end
  end
  
  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      redirect_to(user_article_path(@article.user, @article), :notice => 'Bravo.')
    else
      render :action => "edit"
    end
  end
  
  def show
    @article = Article.where(:id => params[:id], :draft => false).first
    @title = "#{@article.title} par #{@article.user.name}"
  end
end
