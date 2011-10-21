require 'spec_helper'

describe PlaylistsController do
  render_views

  describe "#index" do
    it "returns a m3u document to the browser" do
      get "index", playlist: { order: "artist_name" }
      response.headers["Content-Type"].should include("text/plain")
    end
  end
end
