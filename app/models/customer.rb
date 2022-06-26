class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         has_many :addresses, dependent: :destroy
         has_many :cart_items, dependent: :destroy
         has_many :orders, dependent: :destroy

          def address_display
            "〒"+ postal_code + "  " + address + "   " + first_name + last_name
          end

          validates :first_name,{presence: true,length: {maximum:15}}
          validates :last_name,{presence: true,length: {maximum:15}}
          validates :first_name_kana,{presence: true,length: {maximum:15}}
          validates :last_name_kana,{presence: true,length: {maximum:15}}
          validates :postal_code, {presence: true,length: {maximum:15}}
          validates :address,{presence: true,length: {maximum:40}}
          validates :telephone_number, {presence: true,length: {maximum:20}}
end
