class Step < ApplicationRecord
    validates :title, :content, :activity, presence: true
    
    belongs_to :activity
end
