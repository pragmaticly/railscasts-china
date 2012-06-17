# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    user
    episode
    content { "Content of Comment #{Comment.count + 1}" }
  end
end
