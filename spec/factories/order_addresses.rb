FactoryBot.define do
  factory :order_address do
      postal_code { '123-4567' }
      item_prefecture_id {rand(2..43)}
      city { '京都市' }
      street { '左京区河原町2-1' }
      building_name { 'ローレルコート203' }
      phone_number { '09012345678' }
      token {"tok_abcdefghijk00000000000000000"}
      

  end
end
