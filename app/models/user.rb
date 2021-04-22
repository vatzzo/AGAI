class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :activities, dependent: :destroy
  has_one_attached :avatar

  validates :avatar, content_type: [:png, :jpg, :jpeg]

  def to_s
    email
  end
end
