class Asset < ActiveRecord::Base
  has_many :playlist_orders
  has_many :playlists, :through => :playlist_orders, dependent: :destroy
  mount_uploader :ad_asset_file, AdAssetFileUploader
  
  validates :name, :asset_type, presence: true
  
end
