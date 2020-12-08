class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  with_options presence: true do
    validates :image
    validates :item_name
    validates :text
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :shipping_id
      validates :day_id
    end
    validates :area_id, numericality: { other_than: 0 }
  end
end
