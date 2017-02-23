class Rental < ApplicationRecord
  belongs_to :game
  belongs_to :user

  STATUSES = ["pending", "declined", "active"]

  validates :status, inclusion: { in: [ "pending", "declined", "active" ] }

end
