class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_line, :building_name, :phone_number, :user_id, :item_id

  validates :postal_code, presence: true, format: {
    with: /\A\d{3}-\d{4}\z/,
    message: 'Input correctly'
  }

  validates :prefecture_id, presence: true, numericality: {
    other_than: 1,
    message: 'Select'
  }

  validates :phone_number, presence: true, format: {
    with: /\A\d{10,11}\z/,
    message: 'Input only number'
  }
  validates :city, :address_line, :user_id, :item_id, presence: true

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
