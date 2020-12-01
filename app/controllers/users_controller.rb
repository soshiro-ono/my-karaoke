class UsersController < ApplicationController
  before_action :search_song, only: [:show,:search]


  def show
    @user = User.find(params[:id])
    @songs = @user.songs.page(params[:page]).per(15)
    # モデルのアソシエーションがhas manyだから
  end

  def search
    @songs = @p.result.page(params[:page]).per(15)
  end


  
  private
  def search_song
    @p = Song.where(user_id: current_user.id).ransack(params[:q])  # 検索オブジェクトを生成
  end
end
