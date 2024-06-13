FactoryBot.define do
  factory :user do
    nickname                { Faker::Internet.username(specifier: 5..8) }
    email                   { Faker::Internet.email }
    password                { Faker::Internet.password(min_length: 8, mix_case: true, special_characters: false) }
    password_confirmation   { password }
    first_name              { Faker::Japanese::Name.first_name }
    last_name               { Faker::Japanese::Name.last_name }
    first_name_kana         { Faker::Japanese::Name.first_name.yomi }
    last_name_kana          { Faker::Japanese::Name.last_name.yomi }
    birthday                { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end