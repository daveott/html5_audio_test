class Mp3 < ActiveRecord::Base
  belongs_to :artist
  has_many :ratings

  accepts_nested_attributes_for :ratings

  validates :title, presence: true

  def average_rating
    sprintf("%.1f", (calculate_average_rating)).to_f if ratings.any?
  end

  private
  def calculate_average_rating
    ratings.sum(:score).to_f / ratings.count
  end
end
