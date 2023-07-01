class OrderAddress
  include ActiveModel::Model
  attr_accessor  :postal_code, :item_prefecture_id, :city, :street, :building_name, :phone_number, :item_id, :user_id, :token
  
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/,message: "is invald. Include hyphen(-)"}
    validates :city
    validates :street
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :item_prefecture_id, numericality: { other_than: 1 ,message: "can't be blank"}
 
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(
      postal_code: postal_code, 
      item_prefecture_id: item_prefecture_id, 
      city: city, 
      street: street, 
      building_name: building_name, 
      phone_number: phone_number, 
      order_id: order.id
    )
  end
end