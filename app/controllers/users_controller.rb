class UsersController < ApplicationController
  # if user_signed_in?
    # before_action :search_song, only: [:show,:search]
  # end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings.all
  end

  def show
    @user = User.find(params[:id])
    search_song
    @songs = @user.songs.page(params[:page]).per(15)
    # モデルのアソシエーションがhas manyだから
  end

  def search
    @user = User.find(params[:id])
    search_song
    @songs = @p.result.page(params[:page]).per(15)
  end


  
  private
  def search_song
    return unless user_signed_in?
    @p = Song.where(user_id: @user).ransack(params[:q])  # 検索オブジェクトを生成
  end
end
