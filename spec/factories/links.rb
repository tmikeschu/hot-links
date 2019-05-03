FactoryBot.define do
  factory :link do
    url { Faker::Internet.url }
    read_count { rand(1..20) }
  end
end
