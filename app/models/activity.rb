class Activity < ApplicationRecord
    validates :title, presence: true, length: { minimum: 3 }
    validates :description, presence: true, length: { minimum: 10 }

    has_rich_text :description
end
