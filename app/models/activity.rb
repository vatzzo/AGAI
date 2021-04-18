class Activity < ApplicationRecord
    validates :title, presence: true, length: { minimum: 3 }
    validates :description, presence: true, length: { minimum: 10 }

    # Associations
    belongs_to :user
    has_many :steps, dependent: :destroy

    has_rich_text :description
end
