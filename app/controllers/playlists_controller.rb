class PlaylistsController < ApplicationController
  expose(:order) { params[:playlist][:order] }
  expose(:playlist) { Playlist.compose(order) }

  def index
    send_data(playlist, filename: "playlist.m3u", type: "text/plain")
  end
end
