require 'spec_helper'
describe User do
	describe "validations" do
	    before { FactoryGirl.create(:user)                               		}
	    it { should validate_uniqueness_of(:email) 								}
	end
end