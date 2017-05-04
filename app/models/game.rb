class Game < ActiveRecord::Base
  has_and_belongs_to_many :game_consoles
  belongs_to :category
  
  validates :name, :description, :category_id, presence: true

  mount_uploader :cover_image, GameImageUploader
  mount_uploader :hero_image, GameImageUploader

  def to_param
    [id, name.parameterize].join("-")
  end
  
end
