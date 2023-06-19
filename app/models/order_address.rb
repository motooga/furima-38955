class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture, :city, :street, :building_name, :phone_number
  
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/,message: "is invald. Include hyphen(-)"}
    validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :street
    validates :phone_number, numericality: { only_integer: true }
    validates :user_id
    validates :item_id
  end
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code:postal_code, prefecture: prefecture.name, city: city, street: street, building_name: building_name, phone_number: phone_number,  order_id: order.id)
  end
end