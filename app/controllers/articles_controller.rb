class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]

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
      redirect_to(@article, :notice => 'Bravo.')
    else
      render :action => "new"
    end
  end
  
  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      redirect_to(@article, :notice => 'Bravo.')
    else
      render :action => "edit"
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
end