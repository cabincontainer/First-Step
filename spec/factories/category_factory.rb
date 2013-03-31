FactoryGirl.define do
  sequence(:category_name)        {|n| "category_#{n}" }
  factory :category do
    name                  { "#{FactoryGirl.generate(:category_name)}"   }
  end
end
