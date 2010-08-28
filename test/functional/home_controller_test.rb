require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  context "GET to :index" do
    setup do
      get :index
    end

    should respond_with(:success)
    should render_template(:index)
    should_not set_the_flash
  end
end
