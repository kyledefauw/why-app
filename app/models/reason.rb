class Reason < ActiveRecord::Base
  belongs_to :life_venture
  validates :name, :priority, presence: true
end
