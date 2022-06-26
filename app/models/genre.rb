class Genre < ApplicationRecord
  has_many :item
  validates :name, {presence: true,length: {maximum:20}}
end
