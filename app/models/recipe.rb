class Recipe < ApplicationRecord
  has_many :directions
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  validates :title, :description, presence: true
end
