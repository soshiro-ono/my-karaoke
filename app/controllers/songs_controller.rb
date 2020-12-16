class SongsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show,:search]
  before_action :set_song, only: [:edit, :show, :update,:destroy]  
  before_action :search_song, only: [:index, :search]


  def index
    @songs = Song.all.page(params[:page]).per(15)
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    if @song.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def search
    @songs = @p.result.page(params[:page]).per(15)
  end

  def show
    @favorite = Favorite.new
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
    params.require(:song).permit(:title, :artist, :memo, :genre_id, :interval_id, :gender_id, :populur_id).merge(user_id: current_user.id)
  end

  def set_song
    @song = Song.find(params[:id])
  end

  def search_song
    @p = Song.ransack(params[:q])  # 検索オブジェクトを生成
  end
end



