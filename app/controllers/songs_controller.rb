class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    if @song.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def song_params
    params.require(:song).permit(:song, :artist, :memo).merge(user_id: current_user.id)
  end
end



