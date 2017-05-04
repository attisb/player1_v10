class State < ActiveRecord::Base
  belongs_to :country
  has_many :breweries
  has_many :drinks, :through => :breweries

  validates :name, :iso, :country_id, presence: true

  def to_param
    [id, name.parameterize].join("-")
  end
  
  def self.find_by_first_letter(letter)
    where('name LIKE ?', "#{letter}%").order(name: :asc)
  end
    
end
