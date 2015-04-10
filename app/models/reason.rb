class Reason < ActiveRecord::Base
  belongs_to :life_venture
  validates :name, :priority, presence: true

  PRIORITY = ["Very Important", "Important", "Somewhat", "Not Much", "Very Little"]
end
