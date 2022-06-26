class Address < ApplicationRecord

  belongs_to :customer

  def address_display
    "〒"+ postal_code + "  " + address + "   " + first_name + last_name
  end

  validates :name, {presence: true,length: {maximum:15}}
  validates :postal_code, {presence: true,length: {maximum:15}}
  validates :address,{presence: true,length: {maximum:40}}
end
