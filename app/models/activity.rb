class Activity < ApplicationRecord
    belongs_to :user
    has_many :steps, dependent: :destroy
    has_one_attached :image

    validates :title, presence: true, length: { minimum: 3 }
    validates :description, presence: true, length: { minimum: 10 }
    validates :image, attached: true, content_type: [:png, :jpg, :jpeg]

    has_rich_text :description
end
