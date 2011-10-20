class Mp3sController < ApplicationController
  expose(:mp3s) { Mp3.scoped }
  expose(:mp3)
end
