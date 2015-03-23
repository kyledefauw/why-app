class Step < ActiveRecord::Base
  belongs_to :life_venture
  validates :name, :due_date, presence: true
end
