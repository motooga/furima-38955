FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    last_name { Gimei.name }
    first_name { Gimei.name }
    last_name_kana { Gimei.name.katakana }
    first_name_kana { Gimei.name.katakana }

    email { Faker::Internet.free_email }
    password { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
