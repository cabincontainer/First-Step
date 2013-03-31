require 'spec_helper'
describe Category do
  	describe "relationships" do
      	it { should have_many (:products)             }
  	end

  	describe "validations" do
	    before { FactoryGirl.create(:category)     }
	    it { should validate_uniqueness_of(:name) }
	end
end