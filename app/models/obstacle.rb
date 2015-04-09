class Obstacle < ActiveRecord::Base
  belongs_to :step

  has_many :comments, dependent: :destroy

end
