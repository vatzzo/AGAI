class Activity < ApplicationRecord
    acts_as_ratingable
    acts_as_commentable

    belongs_to :user
    has_many :steps, dependent: :destroy
    has_one_attached :image
    
    has_rich_text :description

    validates :title, presence: true, length: { minimum: 3 }
    validates :is_public, inclusion: { in: [true, false] }
    validates :deadline, presence: true
    validates :image, attached: true, content_type: [:png, :jpg, :jpeg]

    scope :published, -> { where(is_public: true) }
end
