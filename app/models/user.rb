class User < ApplicationRecord
  
  has_many :ferret
  has_many :item
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def admin?; false; end
  enum role: {user: 1, moderator: 2, admin: 3}
end
