class Game < ApplicationRecord
  has_attachment :photo

  belongs_to :user

  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

  def self.search(search)
  where("name ILIKE ? OR description ILIKE ?", "%#{search}%", "%#{search}%")
  end

end
