class Item < ApplicationRecord
belongs_to :user

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :item_category, :item_sales_status_id

validates :item_name, presence: true
validates :item_info, presence: true
validates :item_price, presence: true
validates :item_category_id, numericality: { other_than: 1 }
validates :item_prefecture_id, numericality: { other_than: 1 }
validates :item_sales_status_id, numericality: { other_than: 1 }
validates :item_sheduled_derivery_id, numericality: { other_than: 1 }
validates :item_shipping_fee_status_id, numericality: { other_than: 1 }
end
