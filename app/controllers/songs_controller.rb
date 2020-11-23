class SongsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show,:search]
  before_action :set_spot, only: [:edit, :show, :update,:destroy]  

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

  def show
  end

  def edit
  end


  def update
    if @song.update(song_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @song.destroy
      redirect_to root_path
    else
      redirect_to song_path(@song.id)
    end
  end


  private
  def song_params
    params.require(:song).permit(:title, :artist, :memo).merge(user_id: current_user.id)
  end

  def set_spot
    @song = Song.find(params[:id])
  end
end



