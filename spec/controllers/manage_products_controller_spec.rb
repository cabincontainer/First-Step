require 'spec_helper'

describe ManageProductsController do
  describe "index" do
    it "renders manage products index page" do
      admin = FactoryGirl.create(:user)
      login_as(admin) do
        get :index, locale: "en"

        response.should be_success
        response.should render_template("index")
      end
    end
  end

  describe "new" do
    it "renders create product form" do
      admin = FactoryGirl.create(:user)
      login_as(admin) do
        get :new, locale: "en"

        response.should be_success
        response.should render_template("new")
      end
    end
  end

end
