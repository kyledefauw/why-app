class LifeVenture < ActiveRecord::Base
  has_many :reasons, dependent: :destroy
  has_many :steps, dependent: :destroy
end
