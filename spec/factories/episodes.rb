# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :episode do
    user
    name { "Episode #{Episode.count+1}" }
    permalink { "http://railscasts-china.com/episodes/#{Episode.count+1}" }
    description { "Description of Episode #{Episode.count+1}" }
    notes { "Notes of Episode #{Episode.count+1}" }
    published_at { Time.now }
    seconds { rand(1200) }
    position { rand(100) }
  end
end
