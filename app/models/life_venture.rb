class LifeVenture < ActiveRecord::Base
  belongs_to :user
  has_many :reasons, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_many :obstacles, through: :steps
  has_many :categories, through: :life_venture_categories

  CATEGORIES =  ["Health", "Personal Development", "Career Development", "Relationships", "Spiritual", "Wealth", "Lifestyle/Possession", "Fun/Recreational", "Miscellaneous"]

end
