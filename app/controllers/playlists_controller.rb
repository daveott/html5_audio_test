class PlaylistsController < ApplicationController
  expose(:order) { params[:playlist][:order] }
  expose(:rating) { params[:playlist][:rating].presence }
  expose(:playlist) { Playlist.compose(order, rating: rating) }

  def index
    send_data(playlist, filename: "playlist.m3u", type: "text/plain")
  end
end
