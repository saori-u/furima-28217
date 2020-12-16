class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day


  with_options presence: true do
   validates :image
   validates :name
   validates :text
   validates :price
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :condition_id
  validates :postage_id
  validates :prefecture_id
  validates :day_id
  end
end
