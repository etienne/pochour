class HomeController < ApplicationController
  def index
    @articles = Article.order("created_at DESC").limit(18)
  end
end
