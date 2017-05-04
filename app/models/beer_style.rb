class BeerStyle < ActiveRecord::Base
  has_many :drinks

  validates :name, :description, :abv_range_start, :abv_range_end, presence: true

  def to_param
    [id, name.parameterize].join("-")
  end
  
  def self.find_by_first_letter(letter)
    where('name LIKE ?', "#{letter}%").order(name: :asc)
  end

end
