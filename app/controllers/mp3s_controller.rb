class Mp3sController < ApplicationController
  expose(:mp3s) { Mp3.scoped }

end
