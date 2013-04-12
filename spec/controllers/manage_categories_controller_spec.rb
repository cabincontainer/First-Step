require 'spec_helper'

describe ManageCategoriesController do
  describe "index" do
    it "renders manage categories index page" do
      admin = FactoryGirl.create(:user)
      login_as(admin) do
        get :index, locale: "en"

        response.should be_success
        response.should render_template("index")
      end
    end
  end

  describe "new" do
    it "renders form for create category" do
      admin = FactoryGirl.create(:user)
      login_as(admin) do
        get :new, locale: "en"

        response.should be_success
        response.should render_template("new")
      end
    end
  end

  describe "create" do
    it "create new category" do
      admin = FactoryGirl.create(:user)
      name = "Category spec"
      login_as(admin) do
        lambda {
          post :create, category: { name: name }
        }.should change(Category, :count).by(1)

        response.should redirect_to(manage_categories_path)
        category = Category.last
        category.name.should == name
        flash[:notice].should include("Create category successfully.")
      end
    end
  end

end
