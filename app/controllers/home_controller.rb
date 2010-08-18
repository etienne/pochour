class HomeController < ApplicationController
  def index
    @articles = Article.all(:limit => 12)
  end
end
