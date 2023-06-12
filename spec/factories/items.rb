FactoryBot.define do
  factory :item do
    Faker::Config.locale = :ja
    item_name { generate_japanese_text(39) }
    item_info { generate_japanese_info(999) }
    item_category_id { rand(2..11) }
    item_sales_status_id { rand(2..7) }
    item_shipping_fee_status_id { rand(2..3) }
    item_prefecture_id { rand(2..43) }
    item_scheduled_delivery_id { rand(2..4) }
    item_price { rand(300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test-image.png'), filename: 'test-image.png')
    end
  end
end

def generate_japanese_text(max_length)
  text = Faker::Lorem.paragraph(sentence_count: 5)
  text = Faker::Lorem.paragraph(sentence_count: 5) while text.length > max_length
  text
end

def generate_japanese_info(max_length)
  text = Faker::Lorem.sentence(word_count: 10)
  text = Faker::Lorem.sentence(word_count: 10) while text.length > max_length
  text
end
