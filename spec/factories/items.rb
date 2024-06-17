FactoryBot.define do
  factory :item do
    title { Faker::Lorem.sentence }
    detail { Faker::Lorem.sentence }
    price { 500 }
    association :user
    category_id { 2 }
    prefecture_id { 2 }
    shipping_fee_id { 2 }
    delivery_scheduled_id { 2 }
    status_id { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_image.png')), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
