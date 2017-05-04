class PlaylistOrder < ActiveRecord::Base
  belongs_to :asset
  belongs_to :playlist
end
