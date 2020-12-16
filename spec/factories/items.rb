FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    text {Faker::Lorem.sentence}
    category_id {2}
    condition_id {2}
    postage_id {2}
    prefecture_id {2}
    day_id {2}
    price {1000}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/output-image1.png'), filename: 'output-image1.png')
    end
  end
end
