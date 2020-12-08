FactoryBot.define do
  factory :item do
    image               {'test_image.png'}
    item_name           {'テスト'}
    text                {'テスト'}
    category_id         {2}
    condition_id        {2}
    shipping_id         {2}
    area_id             {2}
    day_id              {2}
    price               {'1000'}
    
    association :user 

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end