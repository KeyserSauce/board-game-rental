class Game < ApplicationRecord
  has_attachment :photo

  CATEGORIES = ["family", "card", "german", "children", "drinking", "group"]

  belongs_to :user

  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :category, inclusion: { in: CATEGORIES }


  def self.search(search)
  where("name ILIKE ? OR description ILIKE ?", "%#{search}%", "%#{search}%")
  end

end
