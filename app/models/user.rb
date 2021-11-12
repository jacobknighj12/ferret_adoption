class User < ApplicationRecord
  attr_accessor :username
  has_many :ferret
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def admin?; false; end
end
