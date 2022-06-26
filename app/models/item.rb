class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :order_items,dependent: :destroy
  belongs_to :genre

  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def with_tax_price
    (price * 1.1).to_i
  end

  validates :name,{presence: true,length: {maximum:20}}
  validates :introduction,{presence: true,length: {maximum:50}}
  validates :price,{presence: true,numericality: true}
  validates :is_active,{inclusion: { in: [true, false] }}
end
