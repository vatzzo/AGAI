class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :ratingable, polymorphic: true

  validates :grade, presence: true, inclusion: { in: (1..5).to_a }
end
