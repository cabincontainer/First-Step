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
      admin = FactoryGirl.create(:user)
      name = "Product name"
      code = "Product code"
      login_as(admin) do
        lambda {
          post :create,
            product: {
              name: name,
              code: code
            },
            specifications: {
              "0"=>{"field"=>"field_1", "value"=>"value_1"},
              "1"=>{"field"=>"field_2", "value"=>"value_2"},
              "2"=>{"field"=>"field_3", "value"=>"value_3"}
            }
        }.should change(Product, :count).by(1)

        response.should redirect_to(manage_products_path)
        product = Product.last
        product.name.should == name
        product.code.should == code
        product.specifications.should == {
          "0"=>{"field"=>"field_1", "value"=>"value_1"},
          "1"=>{"field"=>"field_2", "value"=>"value_2"},
          "2"=>{"field"=>"field_3", "value"=>"value_3"}
        }
        flash[:notice].should include("Create product successfully.")
      end
    end
  end

end
