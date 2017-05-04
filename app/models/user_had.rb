class UserHad < ActiveRecord::Base
  belongs_to :user
  belongs_to :drink
  
  #validates :user_id, uniqueness: {scope: :drink_id}
end
