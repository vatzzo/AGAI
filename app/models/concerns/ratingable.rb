module Ratingable
  extend ActiveSupport::Concern

  included do
    has_many :ratings, as: :ratingable
  end
end
