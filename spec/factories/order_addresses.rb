FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '横浜市' }
    address_line { '青山1-1-1' }
    building_name {}
    phone_number { '09012345678' }
  end
end
