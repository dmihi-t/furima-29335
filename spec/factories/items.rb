FactoryBot.define do
  factory :item do
    name                    { '大変なもの' }
    description             { '本当に大変なものです' }
    category_id             { '2' }
    status_id               { '2' }
    delivery_fee_id         { '2' }
    prefecture_id           { '2' }
    days_shipping_id        { '2' }
    price                   { '4000' }
  end
end
