class Playlist
  attr_accessor :order

  def initialize(order)
    self.order = order
  end

  def self.compose(order)
    new(order).compose!
  end

  def compose!
    parts.join("\n")
  end

  def header
    "#EXTM3U"
  end

  def mp3s
    Mp3.send(order)
  end

  def parts
    [header].tap { |a| a << mp3s.map(&:to_s) }.flatten
  end
end
