class Screen < ActiveRecord::Base
  has_many :screen_orders
  has_many :playlists, :through => :screen_orders, dependent: :destroy
  
  validates :name, :direction, :location, :screen_type, presence: true
end
