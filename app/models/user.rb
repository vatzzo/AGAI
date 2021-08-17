class User < ApplicationRecord
  acts_as_commentable
  acts_as_ratingable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :activities, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :avatar

  validates :avatar, content_type: [:png, :jpg, :jpeg]
  validates :phone_number, numericality: { only_integer: true },
            length: { is: 9 }

  scope :admin, -> { where(is_admin: true) }

  def to_s
    email
  end
end
