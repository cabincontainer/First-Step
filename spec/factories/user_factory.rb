FactoryGirl.define do
  sequence(:user_name)        {|n| "user_#{n}" }
  sequence(:user_email)        {|n| "email_#{n}" }
  factory :user do
    name                  { "#{FactoryGirl.generate(:user_name)}"   }
    email                 { "#{FactoryGirl.generate(:user_email)}@example.com" }
    password              { "#{name}"                                }
    password_confirmation { password                                 }
    persistence_token     { Authlogic::Random.hex_token              }
    perishable_token      { Authlogic::Random.hex_token              }
    admin                 { true }
  end
end
