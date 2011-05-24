class HomeController < ApplicationController
  def index
    @articles = Article.where(:draft => false).order("created_at DESC").limit(18)
  end
end
