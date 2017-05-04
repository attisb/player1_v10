class GameConsole < ActiveRecord::Base
  has_and_belongs_to_many :games

  validates :name, :short_code, :tier, presence: true

  def to_param
    [id, short_code.parameterize].join("-")
  end

end
