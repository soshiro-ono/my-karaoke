class User < ApplicationRecord
  has_many :songs, dependent: :destroy
  # もしユーザーがデータベースから削除されてしまった場合にユーザーがした投稿も全て消える
  has_many :favorites, dependent: :destroy
  has_many :favorited_songs, through: :favorites, source: :song

  def already_favorited?(song)
    self.favorites.exists?(song_id: song.id)
  end


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
