class Event < ActiveRecord::Base
  belongs_to :category

  validates :title, :date, :description, :category_id, presence: true

  mount_uploader :image, EventImageUploader

  def to_param
    [id, date, title.parameterize].join("-")
  end
  
end
