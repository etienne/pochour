require 'spec_helper'

describe ArticlesController do
  before do
    @user = Factory(:user)
    @article = Factory(:article, :user => @user)
  end
  
  context "GET show" do
    before do
      get :show, :user_id => @user.id, :id => @article.id
    end

    it { should respond_with(:success) }
    it { should render_template(:show) }
    it { should_not set_the_flash }
  end
end
