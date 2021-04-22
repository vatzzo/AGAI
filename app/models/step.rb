class Step < ApplicationRecord
    belongs_to :activity

    validates :title, :content, :activity, presence: true
end
