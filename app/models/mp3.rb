class Mp3 < ActiveRecord::Base
  belongs_to :artist
  validates :title, presence: true
end
