FactoryBot.define do
  factory :search_query, class: CargoTask::SearchQuery do
    length { rand(1..10) }
    width { rand(1..10) }
    height { rand(1..10) }
    weight { rand(1..10) }
    volume { rand(1..10) }
    distance { rand(1..10) }
    price { rand(1..10) }
    from { Faker::Address.city }
    to { Faker::Address.city }

    to_create(&:save)
  end
end
