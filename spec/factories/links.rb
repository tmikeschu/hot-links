FactoryGirl.define do
  factory :link do
    url { Faker::Internet.url }
    read_count { 1 + rand(20) }
  end
end
