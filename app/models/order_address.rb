class OrderAddress
  include ActiveModel::Model
  attr_accessor  :postal_code, :prefecture, :city, :street, :building_name, :phone_number, :item_id, :user_id, :token
  
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/,message: "is invald. Include hyphen(-)"}
    validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :street
    validates :phone_number, numericality: { only_integer: true }
    validates :user_id
    validates :item_id
    validates :token
  end
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(
      postal_code: postal_code, 
      prefecture: prefecture, 
      city: city, 
      street: street, 
      building_name: building_name, 
      phone_number: phone_number, 
      order_id: order.id
    )
  end
end