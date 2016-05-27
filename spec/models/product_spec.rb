require 'spec_helper'
describe Product do
	describe "relationships" do
    it { should belong_to (:category)   }
	end

	describe "validations" do
    before { FactoryGirl.create(:product)     }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:code) }
	end
end