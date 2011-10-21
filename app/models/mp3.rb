class Mp3 < ActiveRecord::Base
  belongs_to :artist

  has_many :ratings
  accepts_nested_attributes_for :ratings

  validates :title, presence: true

  scope :artist_name, joins(:artist).order("artists.first_name, artists.last_name ASC")

  def average_rating
    sprintf("%.1f", (calculate_average_rating)).to_f if ratings.any?
  end

  def to_s
    "#EXTINF:#{length}, #{artist.full_name} - #{title}"
  end

  private
  def calculate_average_rating
    ratings.sum(:score).to_f / ratings.count
  end
end
