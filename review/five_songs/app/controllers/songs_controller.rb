class SongsController < ApplicationController
  def index
    @songs = Song.recent_five
  end
end
