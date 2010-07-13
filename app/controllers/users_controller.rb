class UsersController < ApplicationController
  before_filter :ensure_admin!
  
  def index
    @users = User.order('name')
  end
end
