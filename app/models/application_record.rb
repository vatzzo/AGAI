class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.acts_as_ratingable
    include Ratingable
  end

  def self.acts_as_commentable
    include Commentable
  end
end
