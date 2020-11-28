class Song < ApplicationRecord
  belongs_to :user
  has_many :favorited_users, through: :favorites, source: :user
  # いらないかも
  # 投稿が誰にいいねされているのかを簡単に取得できるようになります。

  # アクティブハッシュのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender
  belongs_to_active_hash :interval
  belongs_to_active_hash :genre
  belongs_to_active_hash :populur

  # アクティブハッシュのアソシエーション
end
