class BeerSize < ActiveRecord::Base

  has_many :prices, dependent: :destroy
  has_many :drinks, through: :prices
  # accepts_nested_attributes_for :prices

  validates :name, :image, presence: true

  mount_uploader :image, DrinkSizeImageUploader

end
