class Step < ActiveRecord::Base
  belongs_to :life_venture
  has_many :obstacles
  validates :name, :due_date, presence: true
end
