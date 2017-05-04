class Product < ActiveRecord::Base
  belongs_to :category
  
  validates :name, :description, :price, :category_id, presence: true
  
  mount_uploader :image, MerchImageUploader
  
end
