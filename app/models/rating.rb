class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :ratingable, polymorphic: true
end

# TO DO, Rating in here is wrong shoud be rankingable
# include ActiveModel::Validations
# validates_with RatingableValidator
# class RatingableValidator < ActiveModel::Validator
#   def validate(record)
#     user = Rating.find_by(user: record.user)
#     record.errors.add :user, "This user has already given a grade!" unless user
#   end
# end