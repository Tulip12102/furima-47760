class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_line, :building_name, :phone_number, :user_id, :item_id, :token

  validates :postal_code, :prefecture_id, :city, :address_line, :phone_number, :user_id, :item_id, :token, presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      address_line: address_line,
      building_name: building_name,
      phone_number: phone_number,
      order_id: order.id
    )
  end
end
