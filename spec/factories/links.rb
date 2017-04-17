FactoryGirl.define do
  factory :link do
    url { Faker::Internet.url }
    read_count 1
  end
end
