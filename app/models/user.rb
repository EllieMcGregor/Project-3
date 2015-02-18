class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :favourites
  has_many :recipes, through: :favourites

  has_many :food_items

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { in: 8..20 }

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  def has_role?(role_to_compare)
   self.role.to_s == role_to_compare.to_s
  end
  
end
