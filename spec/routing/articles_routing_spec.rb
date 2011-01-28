require 'spec_helper'

describe "routes for articles" do
  it "routes /:user_id/:id to articles#show" do
    { :get => "/roger-duroger/un-article-trop-cool" }.should route_to(
      :controller => "articles",
      :action => "show",
      :user_id => "roger-duroger",
      :id => "un-article-trop-cool"
    )
  end
end