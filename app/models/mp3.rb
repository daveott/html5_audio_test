class Mp3 < ActiveRecord::Base
  belongs_to :artist
  has_many :ratings

  accepts_nested_attributes_for :ratings

  validates :title, presence: true

  def average_rating
    return unless ratings.any?
    sprintf("%.1f", (ratings.sum(:score).to_f / ratings.count)).to_f
  end
end
