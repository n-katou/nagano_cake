class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  has_many :items, through: :order_items

  def total_price
    item * amount
  end


  enum payment_method: { credit_card: 0, transfer: 1 }
end