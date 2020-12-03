class Song < ApplicationRecord
  belongs_to :user
  has_many :favorited_users, through: :favorites, source: :user
  has_many :favorites, dependent: :destroy
  # いらないかも
  # 投稿が誰にいいねされているのかを簡単に取得できるようになります。

  # アクティブハッシュのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender
  belongs_to_active_hash :interval
  belongs_to_active_hash :genre
  belongs_to_active_hash :populur

  # アクティブハッシュのアソシエーション

  with_options presence: true do
    validates :title
    validates :artist
    validates :interval_id
    validates :gender_id
    validates :genre_id
    validates :populur_id
  end
end
