class Mp3 < ActiveRecord::Base
  belongs_to :artist
  has_many :ratings

  validates :title, presence: true

  def average_rating
    ratings.sum(:score).to_f / ratings.count
  end
end
