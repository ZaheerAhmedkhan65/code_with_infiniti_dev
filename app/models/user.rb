class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { student: 0, admin: 1 }

  validates :role, presence: true

  # to get only student users
  scope :students, -> { where(role: :student) }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_one_attached :avatar

  has_many :login_histories, dependent: :destroy
end
