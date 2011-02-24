class UsersController < ApplicationController
  def index
    @users = User.order('name')
  end
  
  def show
    @user = User.find(params[:user_id])
  end
end
