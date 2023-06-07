FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    last_name {Gimei.name}
    first_name {Gimei.name}
    last_name_kana {Gimei.name.katakana}
    first_name_kana {Gimei.name.katakana}
    
    email {Faker::Internet.free_email}
    password {Faker::Lorem.characters(min_alpha: 1, min_numric: 1, min_length: 6)}
    password_confirmation {password}
  end
end