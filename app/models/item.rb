class Item < ApplicationRecord
belongs_to :user
has_one_attached :image
validates :image, presence: true

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :item_category
belongs_to :item_category
belongs_to :item_sales_status
belongs_to :item_prefecture
belongs_to :item_scheduled_delivery
belongs_to :item_shipping_fee_status

validates :item_name, presence: true
validates :item_info, presence: true
validates :item_price, presence: true, numericality: { greater_than:300, less_than:9999999 }
validates :item_category_id, numericality: { other_than: 1 }
validates :item_prefecture_id, numericality: { other_than: 1 }
validates :item_sales_status_id, numericality: { other_than: 1 }
validates :item_scheduled_delivery_id, numericality: { other_than: 1 }
validates :item_shipping_fee_status_id, numericality: { other_than: 1 }



end
