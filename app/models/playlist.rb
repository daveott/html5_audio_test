class Playlist
  attr_accessor :order, :rating

  def initialize(order, args=nil)
    self.order = order
    self.rating = args[:rating] if args.present?
  end

  def self.compose(order, rating=nil)
    new(order, rating).compose!
  end

  def compose!
    parts.join("\n")
  end

  def header
    "#EXTM3U"
  end

  def mp3s
    Mp3.send(order, rating)
  end

  def parts
    [header].tap { |a| a << mp3s.map(&:to_s) }.flatten
  end
end
