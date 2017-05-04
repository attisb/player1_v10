class Brewery < ActiveRecord::Base
  belongs_to :country
  belongs_to :state
  has_many :drinks
  
  validates :name, :display_name, :country_id, :state_id, presence: true
  
  def to_param
    [id, name.parameterize].join("-")
  end

  def self.find_by_first_letter(letter)
    where('name LIKE ?', "#{letter}%").order(name: :asc)
  end
    
end
