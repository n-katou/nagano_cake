class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  has_many :items, through: :order_items

  def total_price
    item * amount
  end


  enum payment_method: { credit_card: 0, transfer: 1 }

  validates :name, {presence: true,length: {maximum:15}}
  validates :postal_code, {presence: true,length: {maximum:15}}
  validates :address,{presence: true,length: {maximum:40}}
  validates :amount_claimed,{presence: true,numericality: true}
  validates :postage,{presence: true,numericality: true}
  validates :payment_method,{inclusion: {in: Order.payment_methods.keys}}

end