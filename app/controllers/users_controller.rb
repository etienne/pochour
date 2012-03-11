class UsersController < ApplicationController
  def index
    @users = User.order('name')
  end
  
  def show
    @user = User.find(params[:user_id])
    @articles = @user.articles.where(:draft => false).page(params[:page]).order("created_at DESC")
    @title = @user.name
  end
end
