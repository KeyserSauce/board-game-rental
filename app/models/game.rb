class Game < ApplicationRecord
  has_attachment :photo

  belongs_to :user

  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

end
