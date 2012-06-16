# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "github"
    sequence(:uid)
    name { "User #{User.count}" }
  end
end
