class Step < ApplicationRecord
    belongs_to :activity
    has_rich_text :content

    validates :title, :content, :activity, presence: true

    scope :published, -> { where(is_done: true) }
end
