class Rating < ApplicationRecord
  after_create :update_score

  belongs_to :user
  belongs_to :ratingable, polymorphic: true

  private

  def update_score
    new_score = score == 0 ? grade : (score + grade) / subject.ratings.count
    subject.update(score: new_score)

  rescue NoMethodError
    nil
  end

  def subject
    ratingable_type.constantize.find(ratingable_id)
  end

  def score
    subject.score
  end
end
