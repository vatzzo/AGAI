class Step < ApplicationRecord
    belongs_to :activity
    has_rich_text :content

    validates :title, :is_done, presence: true
    validates :is_done, inclusion: { in: [true, false] }

    scope :published, -> { where(is_done: true) }
end
