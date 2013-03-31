FactoryGirl.define do
  sequence(:product_name)        {|n| "product_#{n}" }
  sequence(:product_code)        {|n| "code_#{n}" }
  factory :product do
    name                  { "#{FactoryGirl.generate(:product_name)}"   }
    code                  { "#{FactoryGirl.generate(:product_code)}"   }
  end
end
