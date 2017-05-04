class Playlist < ActiveRecord::Base
  has_many :playlist_orders
  has_many :assets, :through => :playlist_orders, dependent: :destroy

  has_many :screen_orders
  has_many :screens, :through => :screen_orders, dependent: :destroy

  accepts_nested_attributes_for :playlist_orders
  
  validates :name, :direction, presence: true
  
end
