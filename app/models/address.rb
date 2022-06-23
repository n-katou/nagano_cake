class Address < ApplicationRecord

  belongs_to :customer

  def address_display
    "〒"+ postal_code + "  " + address + "   " + first_name + last_name
  end
end
