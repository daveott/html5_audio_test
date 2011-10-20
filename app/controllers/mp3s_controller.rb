class Mp3sController < ApplicationController
  expose(:mp3s) { Mp3.scoped }
  expose(:mp3)

  def create
    respond_with mp3.tap(&:save), notice: "MP3 was successfully created."
  end
end
