class User < ApplicationRecord
  has_many :songs, dependent: :destroy
  # もしユーザーがデータベースから削除されてしまった場合にユーザーがした投稿も全て消える
  has_many :favorites, dependent: :destroy
  has_many :favorited_songs, through: :favorites, source: :song

  def already_favorited?(song)
    self.favorites.exists?(song_id: song.id)
  end

  with_options presence: true do
    validates :nickname
    validates :password,format: {with:/\A[a-zA-Z0-9]+\z/,length:{minimum:6}, message:"パスワードは6文字以上で半角英数字混合で入力してください"}
  end




  # フォロー機能
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow

  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :user
  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end
  
  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end
  
  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  # フォロー機能


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
