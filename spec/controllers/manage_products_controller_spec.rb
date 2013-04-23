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

  describe "create" do
    it "create new product" do
      category = FactoryGirl.create(:category)
      admin = FactoryGirl.create(:user)
      name = "Product name"
      code = "Product code"
      login_as(admin) do
        lambda {
          post :create,
            product: {
              name: name,
              code: code,
              best_seller: true
            },
            specifications: {
              "0"=>{"field"=>"field_1", "value"=>"value_1"},
              "1"=>{"field"=>"field_2", "value"=>"value_2"},
              "2"=>{"field"=>"field_3", "value"=>"value_3"}
            },
            category_name: category.name
        }.should change(Product, :count).by(1)

        response.should redirect_to(manage_products_path)
        product = Product.last
        product.name.should == name
        product.code.should == code
        product.best_seller.should == true
        product.specifications.should == {
          "0"=>{"field"=>"field_1", "value"=>"value_1"},
          "1"=>{"field"=>"field_2", "value"=>"value_2"},
          "2"=>{"field"=>"field_3", "value"=>"value_3"}
        }
        product.category.should == category
        flash[:notice].should include("Create product successfully.")
      end
    end

    it "create new product best_seller false" do
      category = FactoryGirl.create(:category)
      admin = FactoryGirl.create(:user)
      name = "Product name"
      code = "Product code"
      login_as(admin) do
        lambda {
          post :create,
            product: {
              name: name,
              code: code,
              best_seller: nil
            },
            specifications: {
              "0"=>{"field"=>"field_1", "value"=>"value_1"},
              "1"=>{"field"=>"field_2", "value"=>"value_2"},
              "2"=>{"field"=>"field_3", "value"=>"value_3"}
            },
            category_name: category.name
        }.should change(Product, :count).by(1)

        response.should redirect_to(manage_products_path)
        product = Product.last
        product.name.should == name
        product.code.should == code
        product.best_seller.should == false
        product.specifications.should == {
          "0"=>{"field"=>"field_1", "value"=>"value_1"},
          "1"=>{"field"=>"field_2", "value"=>"value_2"},
          "2"=>{"field"=>"field_3", "value"=>"value_3"}
        }
        product.category.should == category
        flash[:notice].should include("Create product successfully.")
      end
    end
  end

  describe "show" do
    it "show product information" do
      product = FactoryGirl.create(:product)
      admin = FactoryGirl.create(:user)
      login_as(admin) do
        get :show, locale: "en", id: product.id

        response.should be_success
        response.should render_template("show")
      end
    end
  end

  describe "edit" do
    it "renders form for edit product" do
      product = FactoryGirl.create(:product)
      admin = FactoryGirl.create(:user)
      login_as(admin) do
        get :edit, locale: "en", id: product.id

        response.should be_success
        response.should render_template("edit")
      end
    end
  end

  describe "update" do
    it "update product data" do
      category = FactoryGirl.create(:category)
      product = FactoryGirl.create(:product)
      admin = FactoryGirl.create(:user)
      login_as(admin) do
        put :update, locale: "en", id: product.id, product: {
          name: "New product name",
          code: "New product code",
          best_seller: true
        },
        specifications: {
          "0"=>{"field"=>"new_field_1", "value"=>"new_value_1"},
          "1"=>{"field"=>"new_field_2", "value"=>"new_value_2"},
          "2"=>{"field"=>"new_field_3", "value"=>"new_value_3"}
        },
        category_name: category.name

        product.reload
        product.name.should == "New product name"
        product.code.should == "New product code"
        product.best_seller.should == true
        product.specifications.should == {
          "0"=>{"field"=>"new_field_1", "value"=>"new_value_1"},
          "1"=>{"field"=>"new_field_2", "value"=>"new_value_2"},
          "2"=>{"field"=>"new_field_3", "value"=>"new_value_3"}
        }
        product.category.should == category
        flash[:notice].should include("Update product successfully.")
        response.should redirect_to(manage_products_path)
      end
    end

    it "update product data best_seller from true to false" do
      category = FactoryGirl.create(:category)
      product = FactoryGirl.create(:product, best_seller: true)
      admin = FactoryGirl.create(:user)
      login_as(admin) do
        put :update, locale: "en", id: product.id, product: {
          name: "New product name",
          code: "New product code",
          best_seller: nil
        },
        specifications: {
          "0"=>{"field"=>"new_field_1", "value"=>"new_value_1"},
          "1"=>{"field"=>"new_field_2", "value"=>"new_value_2"},
          "2"=>{"field"=>"new_field_3", "value"=>"new_value_3"}
        },
        category_name: category.name

        product.reload
        product.name.should == "New product name"
        product.code.should == "New product code"
        product.best_seller.should == false
        product.specifications.should == {
          "0"=>{"field"=>"new_field_1", "value"=>"new_value_1"},
          "1"=>{"field"=>"new_field_2", "value"=>"new_value_2"},
          "2"=>{"field"=>"new_field_3", "value"=>"new_value_3"}
        }
        product.category.should == category
        flash[:notice].should include("Update product successfully.")
        response.should redirect_to(manage_products_path)
      end
    end
  end

  describe "destroy" do
    it "permanent delete product" do
      product = FactoryGirl.create(:product)
      admin = FactoryGirl.create(:user)
      login_as(admin) do
        lambda {
          delete :destroy, locale: "en", id: product.id
        }.should change(Product, :count).by(-1)

        Product.where(id: product.id).count.should == 0
        flash[:notice].should include("Delete product successfully.")
        response.should redirect_to(manage_products_path)
      end
    end
  end

end
