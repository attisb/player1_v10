class User < ActiveRecord::Base
  include Clearance::User

  has_many :user_hads
  has_many :user_wants
  has_many :notes, dependent: :destroy 

  validates :first_name, :last_name, presence: true

  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.active = true if self.active.nil?
    self.admin = false if self.admin.nil?
    self.moderator = false if self.moderator.nil?
  end
end
