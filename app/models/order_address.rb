class OrderAddress < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :block, :building, :tel, :item_id, :user_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :tel, format: { with: /\A\d{10,11}\z/, message: 'input only number' }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :block
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, tel: tel, order_id: order.id)
  end
end
