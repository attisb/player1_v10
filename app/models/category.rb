class Category < ActiveRecord::Base
  has_many :events
  has_many :games
  has_many :products
  
  validates :name, :description, :bucket_type, presence: true

  def to_param
    [id, name.parameterize].join("-")
  end
  
end
