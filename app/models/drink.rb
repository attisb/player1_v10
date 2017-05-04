class Drink < ActiveRecord::Base
  belongs_to :beer_group
  belongs_to :beer_style
  belongs_to :brewery
  
  has_many :prices, dependent: :destroy 
  has_many :beer_sizes, through: :prices
  has_many :user_wants
  has_many :user_hads
  has_many :notes, dependent: :destroy 
  
  accepts_nested_attributes_for :prices, :allow_destroy => true

  before_save :downcase_stuff
  mount_uploader :image, DrinkImageUploader
  
  
  validates :name, :abv, :beer_group_id, :beer_style_id, :brewery_id, :short_description, :color, presence: true
  
  
  def to_param
    [id, name.parameterize].join("-")
  end
  
  def self.find_by_first_letter(letter)
    where('name LIKE ?', "#{letter}%").order(name: :asc)
  end
  

  private
    def downcase_stuff
      self.name = self.name.titleize
      self.description = self.description.humanize
      self.short_description = self.short_description.humanize
    end
    
end
