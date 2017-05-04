class Price < ActiveRecord::Base
  belongs_to :beer_size
  belongs_to :drink

  validates :amount, presence: true

  scope :order_by_name, -> { includes(:drink).order('drinks.name') }
end
