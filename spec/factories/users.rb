FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { '1a1a1a' }
    password_confirmation { password }
    first_name_kanji      { '佐藤' }
    last_name_kanji       { '太郎' }
    first_name_kana       { 'サトウ' }
    last_name_kana        { 'タロウ' }
    birthday              { Faker::Date.between(from: '2020-01-01', to: '2020-12-31') }
  end
end
