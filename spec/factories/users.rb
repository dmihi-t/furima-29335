FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'aaa111' }
    password_confirmation { password }
    date_of_birth         { '1983-09-08' }
    first_name            { '山本' }
    last_name             { '工事' }
    first_name_kana       { 'ヤマモト' }
    last_name_kana        { 'コウジ' }
  end
end
