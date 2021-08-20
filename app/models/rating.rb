class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :ratingable, polymorphic: true

  validates :grade, inclusion: { in: [0..5] }
end
