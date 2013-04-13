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

  describe "edit" do
    it "renders form for edit category" do
      category = FactoryGirl.create(:category)
      admin = FactoryGirl.create(:user)
      login_as(admin) do
        get :edit, locale: "en", id: category.id

        response.should be_success
        response.should render_template("edit")
      end
    end
  end

  describe "update" do
    it "update category data" do
      category = FactoryGirl.create(:category)
      admin = FactoryGirl.create(:user)
      login_as(admin) do
        put :update, locale: "en", id: category.id, category: { name: "New category name" }

        category.reload
        category.name.should == "New category name"
        flash[:notice].should include("Update category successfully.")
        response.should redirect_to(manage_categories_path)
      end
    end
  end

  describe "destroy" do
    it "permanent delete category" do
      category = FactoryGirl.create(:category)
      admin = FactoryGirl.create(:user)
      login_as(admin) do
        lambda {
          delete :destroy, locale: "en", id: category.id
        }.should change(Category, :count).by(-1)

        Category.where(id: category.id).count.should == 0
        flash[:notice].should include("Delete category successfully.")
        response.should redirect_to(manage_categories_path)
      end
    end
  end

end
