class LifeVenture < ActiveRecord::Base
  belongs_to :user
  has_many :reasons, dependent: :destroy
  has_many :steps, dependent: :destroy
end
