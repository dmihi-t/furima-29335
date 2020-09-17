FactoryBot.define do
  factory :order_shipping do

    token          { 'token' }
    postal_code    { '755-0000' }
    prefecture_id  { '2' }
    city           { '福岡市' }
    address        { '1-1-1' }
    phone_number   { '09012345678' }
    building_name  { 'なし' }
    
  end
end
