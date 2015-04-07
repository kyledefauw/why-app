class User < ActiveRecord::Base

validates :first_name, :last_name, :date_of_birth, :email, :presence => true
validates :email, :uniqueness => true

has_secure_password

has_many :life_ventures
has_many :comments, dependent: :nullify

  def full_name
    "#{first_name} #{last_name}"
  end

end
