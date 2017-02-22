class Game < ApplicationRecord
  has_attachment :photo
  has_many :rentals
  has_many :users, through: :rentals
  belongs_to :user

  CATEGORIES = ["family", "card", "german", "children", "drinking", "group"]

  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :category, inclusion: { in: CATEGORIES }


  def self.search(search)
  where("name ILIKE ? OR description ILIKE ?", "%#{search}%", "%#{search}%")
  end

end
