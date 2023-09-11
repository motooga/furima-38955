class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_many_attached :images
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_sales_status
  belongs_to :item_prefecture
  belongs_to :item_scheduled_delivery
  belongs_to :item_shipping_fee_status

  validates :item_name, presence: true, length: { maximum: 40 }
  validates :item_info, presence: true, length: { maximum: 1000 }
  validates :item_price, presence: true,
                         numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :item_category_id, numericality: { other_than: 1 , message: "は「---」以外を選択してください。"} 
  validates :item_prefecture_id, numericality: { other_than: 1 , message: "は「---」以外を選択してください。"} 
  validates :item_sales_status_id, numericality: { other_than: 1 , message: "は「---」以外を選択してください。"} 
  validates :item_scheduled_delivery_id, numericality: { other_than: 1 , message: "は「---」以外を選択してください。"} 
  validates :item_shipping_fee_status_id, numericality: { other_than: 1 ,  message: "は「---」以外を選択してください。"} 
end
