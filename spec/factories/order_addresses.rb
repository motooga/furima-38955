FactoryBot.define do
  factory :order_address do
      postal_code { '123-4567' }
      prefecture {rand(2..43)}
      city { '京都市' }
      street { '左京区河原町2-1' }
      building_name { 'ローレルコート203' }
      phon_number { '09012345678' }
  end
end
