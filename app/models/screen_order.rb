class ScreenOrder < ActiveRecord::Base
  belongs_to :screen
  belongs_to :playlist
end
