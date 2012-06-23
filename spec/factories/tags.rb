# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
    name { "Tag #{Tag.count + 1}" }
  end
end
