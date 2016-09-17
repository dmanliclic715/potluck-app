class Potluck < ActiveRecord::Base
  has_many :attendances
  has_many :attendees, through: :attendances, source: :guest
  belongs_to :host, class_name: "User", foreign_key: :user_id

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :time, presence: true
end
