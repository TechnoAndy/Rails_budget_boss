class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { in: 3..50 }
  validates :email, presence: true
  validates :password, presence: true

  # Associations
  has_many :chronicles, dependent: :destroy
  has_many :groups, dependent: :destroy
end
