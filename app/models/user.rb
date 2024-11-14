class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { student: 0, admin: 1 }

  # to get only student users
  scope :students, -> { where(role: :student) }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  # Associations
  has_many :messages , dependent: :destroy
  has_many :conversations_as_sender, class_name: 'Conversation', foreign_key: 'sender_id'
  has_many :conversations_as_receiver, class_name: 'Conversation', foreign_key: 'receiver_id'

  has_one_attached :avatar
  # validates :avatar, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 5.megabytes }

  after_create :create_conversations_with_existing_users

  has_many :login_histories, dependent: :destroy

  
  private

  def create_conversations_with_existing_users
    User.where.not(id: self.id).find_each do |user|
      Conversation.create(sender_id: self.id, receiver_id: user.id)
    end
  end

end
