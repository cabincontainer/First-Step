require 'spec_helper'

describe HomesController do
	describe "index" do
    it "renders homes index" do
      admin = FactoryGirl.create(:user)
      login_as(admin) do
        get :index, locale: "en"

        response.should be_success
        response.should render_template("index")
      end
    end
  end

end
