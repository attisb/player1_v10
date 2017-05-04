class BeerGroup < ActiveRecord::Base
  has_many :drinks

  validates :name, :description, presence: true

  def to_param
    [id, name.parameterize].join("-")
  end

end
