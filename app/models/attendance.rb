class Attendance < ActiveRecord::Base
  belongs_to :guest, class_name: "User", foreign_key: :user_id
  belongs_to :potluck

  validates :dish, presence: true, uniqueness: { case_sensitive: false, scope: :potluck_id, message: "is already being brought" }
end
